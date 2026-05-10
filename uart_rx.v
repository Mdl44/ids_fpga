module uart_rx (
    input            clk,
    input            rst_n, //reset
    input            rx,
    output reg [7:0] data_out, //bitii primiti
    output reg       valid //semnalul pentru pachet
);
    localparam CLK_PER_BIT = 235; // 27 MHz / baud rate
    localparam HALF        = CLK_PER_BIT / 2;

    reg rx_d1, rx_d2; //flip-flops
    always @(posedge clk or negedge rst_n) begin //posedge clk - Positive Edge (creste de la 0 la 1) negedge - Negative Edge (pentru butonul de reset de pe placa)
        if (!rst_n) { rx_d1, rx_d2 } <= 2'b11; // daca e apasat butonul de reset, pun 1 la rx (nu se transmit date)
        else        { rx_d2, rx_d1 } <= { rx_d1, rx }; // registrul 2 tine valoarea curata a lui rx, registrul 1 pe cea bruta
    end

    // starile 
    localparam IDLE  = 2'd0;
    localparam START = 2'd1;
    localparam DATA  = 2'd2;
    localparam STOP  = 2'd3;

    reg [1:0]  state; //starea curenta
    reg [7:0]  cnt; //cnt pentru clock
    reg [2:0]  bit_idx; //ce bit am primit
    reg [7:0]  shift; //adun toti bitii 

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin //reset
            state    <= IDLE;
            cnt      <= 8'd0;
            bit_idx  <= 3'd0;
            shift    <= 8'd0;
            data_out <= 8'd0;
            valid    <= 1'b0;
        end else begin
            valid <= 1'b0;

            case (state)
                IDLE: begin
                    cnt     <= 8'd0;
                    bit_idx <= 3'd0;
                    if (!rx_d2)
                        state <= START;
                end

                START: begin
                    if (cnt == HALF - 1) begin 
                        cnt <= 8'd0;
                        if (!rx_d2) //verifica daca e bit de start sau noise
                            state <= DATA;
                        else
                            state <= IDLE;
                    end else
                        cnt <= cnt + 8'd1;
                end

                DATA: begin
                    if (cnt == CLK_PER_BIT - 1) begin //234 de pasi
                        cnt     <= 8'd0;
                        shift   <= { rx_d2, shift[7:1] }; //pun la inceput noul bit primit, ceilalti 7 sunt shiftati la dreapta
                        if (bit_idx == 3'd7) begin //daca s a trimis tot octetul
                            bit_idx <= 3'd0;
                            state   <= STOP;
                        end else
                            bit_idx <= bit_idx + 3'd1;
                    end else
                        cnt <= cnt + 8'd1;
                end

                STOP: begin
                    if (cnt == CLK_PER_BIT - 1) begin //pentru bitul de stop
                        cnt   <= 8'd0;
                        state <= IDLE;
                        if (rx_d2) begin // s a intors la valoarea 1 (liniste)
                            data_out <= shift;
                            valid    <= 1'b1;
                        end
                    end else
                        cnt <= cnt + 8'd1;
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule