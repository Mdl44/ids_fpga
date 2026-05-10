module top (
    input  clk,
    input  rx,
    output tx
);

    wire [7:0] rx_data_wire;
    wire       rx_done_wire;

    uart_rx receptor (
        .clk     (clk),
        .rst_n   (1'b1), //nu folosesc butonul de reset fizic
        .rx      (rx),
        .data_out(rx_data_wire),
        .valid   (rx_done_wire)
    );

    reg       tx_start_reg = 1'b0;
    reg [7:0] tx_data_reg  = 8'd0;
    wire      tx_busy_wire;

    uart_tx transmitator (
        .clk    (clk),
        .rst_n  (1'b1),
        .tx     (tx),
        .data_in(tx_data_reg),
        .start  (tx_start_reg),
        .busy   (tx_busy_wire)
    );

    reg [5:0]   byte_counter = 6'd0;
    reg [287:0] buffer_date  = 288'd0;

    wire [10:0] w_Packet_Length_Min      = buffer_date[266:256];
    wire [15:0] w_Flow_IAT_Mean          = buffer_date[239:224];
    wire        w_ACK_Flag_Count         = buffer_date[192];
    wire [15:0] w_Fwd_IAT_Mean           = buffer_date[175:160];
    wire [10:0] w_Bwd_Packet_Length_Min  = buffer_date[138:128];
    wire        w_URG_Flag_Count         = buffer_date[96];
    wire [11:0] w_Bwd_Packet_Length_Mean = buffer_date[75:64];
    wire [11:0] w_Fwd_Packet_Length_Min  = buffer_date[43:32];
    wire [7:0]  w_Bwd_IAT_Min            = buffer_date[7:0];

    wire alert_wire;

    IDS_Top ids (
        .Packet_Length_Min     (w_Packet_Length_Min),
        .Flow_IAT_Mean         (w_Flow_IAT_Mean),
        .ACK_Flag_Count        (w_ACK_Flag_Count),
        .Fwd_IAT_Mean          (w_Fwd_IAT_Mean),
        .Bwd_Packet_Length_Min (w_Bwd_Packet_Length_Min),
        .URG_Flag_Count        (w_URG_Flag_Count),
        .Bwd_Packet_Length_Mean(w_Bwd_Packet_Length_Mean),
        .Fwd_Packet_Length_Min (w_Fwd_Packet_Length_Min),
        .Bwd_IAT_Min           (w_Bwd_IAT_Min),
        .alert                 (alert_wire)
    );

    localparam HEADER = 2'd0;
    localparam DATA   = 2'd1;
    localparam SEND   = 2'd2;
    localparam WAIT   = 2'd3;

    reg [1:0] stare = HEADER;

    always @(posedge clk) begin
        case (stare)

            HEADER: begin
                tx_start_reg <= 1'b0;
                byte_counter <= 6'd0;
                if (rx_done_wire && rx_data_wire == 8'hAA) // asteapta un byte valid (byte ul concatenat la fiecare pachet in header)
                    stare <= DATA;
            end

            DATA: begin
                tx_start_reg <= 1'b0;
                if (rx_done_wire) begin
                    buffer_date  <= { buffer_date[279:0], rx_data_wire }; // adauga  in buffer bytes pana cand se strang toti 36
                    byte_counter <= byte_counter + 6'd1;
                    if (byte_counter == 6'd35)
                         stare <= SEND;
                 end
             end

            SEND: begin
                tx_data_reg  <= { 7'b0000000, alert_wire };
                tx_start_reg <= 1'b1;
                stare        <= WAIT;
            end

            WAIT: begin
                tx_start_reg <= 1'b0;
                if (!tx_busy_wire)
                    stare <= HEADER;
            end

        endcase
    end

endmodule