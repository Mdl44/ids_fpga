module uart_tx (
    input            clk,
    input            rst_n,
    output reg       tx,
    input      [7:0] data_in,
    input            start,
    output reg       busy
);
    localparam CLK_PER_BIT = 235;

    localparam IDLE  = 2'd0;
    localparam START = 2'd1;
    localparam DATA  = 2'd2;
    localparam STOP  = 2'd3;

    reg [1:0] state;
    reg [7:0] cnt;
    reg [2:0] bit_idx;
    reg [7:0] shift;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state   <= IDLE;
            tx      <= 1'b1;
            busy    <= 1'b0;
            cnt     <= 8'd0;
            bit_idx <= 3'd0;
            shift   <= 8'd0;
        end else begin
            case (state)
                IDLE: begin
                    tx   <= 1'b1;
                    busy <= 1'b0;
                    cnt  <= 8'd0;
                    if (start) begin
                        shift <= data_in;
                        busy  <= 1'b1;
                        state <= START;
                    end
                end

                START: begin
                    tx <= 1'b0;
                    if (cnt == CLK_PER_BIT - 1) begin
                        cnt     <= 8'd0;
                        bit_idx <= 3'd0;
                        state   <= DATA;
                    end else
                        cnt <= cnt + 8'd1;
                end

                DATA: begin
                    tx <= shift[0];
                    if (cnt == CLK_PER_BIT - 1) begin
                        cnt   <= 8'd0;
                        shift <= { 1'b0, shift[7:1] };
                        if (bit_idx == 3'd7) begin
                            bit_idx <= 3'd0;
                            state   <= STOP;
                        end else
                            bit_idx <= bit_idx + 3'd1;
                    end else
                        cnt <= cnt + 8'd1;
                end

                STOP: begin
                    tx <= 1'b1;
                    if (cnt == CLK_PER_BIT - 1) begin
                        cnt   <= 8'd0;
                        state <= IDLE;
                    end else
                        cnt <= cnt + 8'd1;
                end

                default: begin
                    state <= IDLE;
                    tx    <= 1'b1;
                end
            endcase
        end
    end

endmodule