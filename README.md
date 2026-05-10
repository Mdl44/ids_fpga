# Hardware-Accelerated DDoS Detection System (FPGA-based)

## 1. Project Overview
This project implements a **Intrusion Detection System (IDS)** designed to detect DDoS attacks in real-time. The system leverages a hybrid approach: training an **Isolation Forest** machine learning model in Python and deploying the resulting decision trees directly onto a **Tang Nano 4K FPGA** using Verilog.

By offloading the detection logic to hardware, the system achieves near-instantaneous inference, processing network features at nanosecond speeds, significantly reducing the overhead on the host CPU.

### Key Features:
* **Machine Learning on Silicon:** Automated translation of Scikit-Learn Isolation Forest models into optimized Verilog RTL.
* **High Performance:** Hardware-accelerated anomaly detection with minimal latency.
* **Edge Deployment:** Designed for low-power FPGA boards (Gowin LittleBee architecture).
* **End-to-End Pipeline:** Includes data preprocessing, model training, hardware generation, and a Python-FPGA communication interface (UART).


## 2. Dataset: CIC-DDoS2019
The system is trained and validated using the **CIC-DDoS2019** dataset.

### Approach: Binary Anomaly Detection
To optimize hardware resource utilization, the problem is framed as **Binary Classification**:
* **0 (Benign):** Normal network traffic.
* **1 (Anomaly/Attack):** Any traffic pattern deviating from the learned "normal" baseline. This unsupervised-learning approach allows the system to potentially flag **Zero-Day** attacks.

### Feature Selection
Out of the 80+ available attributes in the original dataset, **9 key features** were selected to balance detection accuracy with FPGA gate count (LUT usage). Each feature is transmitted as a 32-bit big-endian word over UART, forming a 37-byte packet (1 header byte + 9 × 4 data bytes).

#### Traffic Volume Features
| Feature | Description |
|---|---|
| `Packet Length Min` | The smallest packet size observed across the entire flow |
| `Fwd Packet Length Min` | The smallest packet size in the forward direction (server → client) |
| `Bwd Packet Length Min` | The smallest packet size in the backward direction (client → server) |
| `Bwd Packet Length Mean` | The average packet size in the backward direction |

#### Timing Features
| Feature | Description |
|---|---|
| `Flow IAT Mean` | The average time between consecutive packets in both directions *(scaled ÷1024 before transmission — raw values exceed 16-bit range)* |
| `Fwd IAT Mean` | The average inter-arrival time between forward-direction packets *(scaled ÷1024 before transmission)* |
| `Bwd IAT Min` | The shortest time gap between any two consecutive backward-direction packets |

#### TCP Flag Features
| Feature | Description |
|---|---|
| `ACK Flag Count` | Number of packets with the TCP Acknowledgment flag set |
| `URG Flag Count` | Number of packets with the TCP Urgent flag set |


### Covered Attack Types (Original Labels)
Although the FPGA operates on a strict binary logic (Benign vs. Attack) to maximize throughput, the Isolation Forest model was trained and validated against a highly diverse threat landscape. The CIC-DDoS2019 dataset includes the following modern attack vectors, which our IDS treats as anomalies:

* **Reflection & Amplification Attacks:** * `DNS`, `LDAP`, `NTP`, `NetBIOS`, `SNMP`, `SSDP`, `TFTP`, `MSSQL`, `PortMap`
* **Flood Attacks:** * `SYN Flood`, `UDP Flood`, `UDP-Lag`
* **Application Layer Attacks:** * `WebDDoS`

By grouping these diverse labels under a single `1 (Anomaly)` class, the system demonstrates resilience against both volumetric floods and complex reflection techniques without needing distinct signatures for each.

## 3. Machine Learning Pipeline: Isolation Forest

To achieve real-time anomaly detection, the system uses an **Isolation Forest** algorithm. Isolation Forest is an unsupervised learning algorithm that isolates anomalies based on their fundamental differences from normal traffic.

### 3.1. The "Path Length" Concept
The core logic relies on decision tree **Path Length**:
* **Normal Traffic (Benign):** Forms dense clusters. It requires many random splits (a deep tree path) to isolate a single normal packet.
* **Attacks (Anomalies):** Are extreme outliers (e.g., massive packet sizes or zero latency). They are easily distinguishable and get isolated in very few splits (a short tree path).

By evaluating the average path length across all trees, the FPGA can classify any packet with a path length shorter than a specific threshold as an attack.

### 3.2. Hardware-Aware Optimizations
Machine learning models natively use floating-point arithmetic, which is inefficient and resource-heavy on FPGAs. To deploy the model onto the Tang Nano 4K, optimizations were implemented directly in the Python pipeline:

1. **Feature Scaling (Bit-Width Optimization):**
   Massive microsecond values, such as `Flow IAT Mean` and `Fwd IAT Mean`, easily exceed standard hardware register sizes. These features are scaled down (divided by `1024`) to fit within **16-bit registers**, maintaining their variance and distribution shape.

2. **Minimalist Forest Architecture:**
   To fit within the FPGA's logic element limitations (~4600 LUTs), the model is constrained to **4 estimators (trees)** and a maximum of **512 samples** per tree. This ensures a minimal silicon footprint while preserving high detection accuracy.

3. **Exact Integer Arithmetic Translation:**
   FPGAs cannot compute floating-point anomaly scores efficiently. The Python generation script simulates exact FPGA arithmetic by calculating the theoretical leaf depth of the Isolation Forest, multiplying it by 100, and rounding it to an integer. The hardware simply accumulates these integer path lengths across all trees and compares the sum against a pre-calculated integer threshold (`INT_THRESHOLD`).

4. **F1-Score Thresholding:**
   Instead of optimizing purely for overall accuracy, the decision threshold is mathematically selected by evaluating 500 candidate thresholds to maximize the **F1 Score**. This severely reduces False Positives (alarms triggered by normal traffic).

## 4. Hardware Implementation (Verilog)

The anomaly detection engine is deployed on a **Tang Nano 4K** (Gowin GW1NZ-LV4) FPGA. The hardware architecture is designed for maximum throughput, utilizing a custom UART bridge to interface with the host PC.

### 4.1. Top-Level Controller & FSM (`top.v`)
The top module acts as the system's orchestrator, routing data between the serial interfaces and the ML engine. It maintains a massive **288-bit shift register** (`buffer_date`) to reconstruct the 36-byte payload sent by the Python script. 

The packet processing is governed by a 4-stage Finite State Machine (FSM):
1. **`HEADER`**: Listens for the magic synchronization byte (`0xAA`) to prevent frame misalignment.
2. **`DATA`**: Accumulates exactly 36 bytes of features into the shift register.
3. **`SEND`**: Captures the immediate anomaly decision from the IDS engine, pads it into an 8-bit frame, and triggers the transmitter.
4. **`WAIT`**: Idles until the TX module finishes sending the result back to the host.

Data is mapped from the shift register to the IDS engine using strict Little-Endian bit-slicing (e.g., `buffer_date[266:256]` for an 11-bit feature), ensuring optimal resource usage without wasting logic gates on unused bits.

### 4.2. Combinatorial ML Inference (`ids.v`)
A fundamental advantage of this FPGA implementation is how the Isolation Forest executes. Unlike software execution which evaluates instructions sequentially, the `IDS_Top` module is purely **combinatorial hardware**. 

It contains no clock or memory registers. The 4 decision trees are synthesized into a labyrinth of logic gates. Once the 288-bit buffer is full, the electrical signals propagate through the trees simultaneously. The scores are summed and compared to the integer threshold (`4730`) in mere nanoseconds, yielding an instantaneous `alert` decision.

### 4.3. Custom UART Interface (`uart_rx.v` & `uart_tx.v`)
To eliminate the overhead of soft-core processors, a custom UART transceiver was written in Verilog, operating at **115200 baud** based on the board's 27 MHz clock.

* **Metastability Protection:** The RX module implements a two-stage flip-flop synchronizer to safely sample the asynchronous external signal, preventing the state machine from entering an unstable state due to clock domain crossing.
* **Noise Filtering:** The receiver oversamples the line, counting to the exact middle of the start bit to verify its validity before reading the payload, effectively filtering out electrical noise.

### 4.4. Physical Constraints & Safety
* **Clocking (`timing.sdc`):** The onboard 27 MHz crystal oscillator is explicitly defined with a 37.037 ns period to ensure precise baud-rate timing calculations.
* **I/O Voltage (`uart_pins.cst`):** To protect the Tang Nano 4K's delicate core, the UART TX/RX pins are strictly constrained to the **LVCMOS33** (3.3V) standard. This prevents overvoltage damage from 5V USB-TTL adapters.


## 5. Results & Conclusions
**Overall Performance Metrics:**
* **Total Packets Processed:** 306,201
* **Final Accuracy:** 98.54%
* **F1 Score:** 0.9912

**Confusion Matrix Breakdown:**
* **Detected Attacks (True Positives):** 252,353 (99.04%)
* **Correct Normal (True Negatives):** 49,370 (96.04%)
* **False Alarms (False Positives):** 2,034 (3.96%)
* **Missed Attacks (False Negatives):** 2,444 (0.96%)

**Throughput & Stability:**
* **Average UART Rate:** 176.4 pkts/sec
* **Total Execution Time:** ~28 minutes (1735.7s)
* **Hardware Timeouts:** 0 (demonstrating flawless UART synchronization, perfect FSM stability, and zero data corruption over prolonged transmission)

