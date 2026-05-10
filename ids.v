module Tree_0 (
    input [10:0] Packet_Length_Min,
    input [15:0] Flow_IAT_Mean,
    input       ACK_Flag_Count,
    input [15:0] Fwd_IAT_Mean,
    input [10:0] Bwd_Packet_Length_Min,
    input       URG_Flag_Count,
    input [11:0] Bwd_Packet_Length_Mean,
    input [11:0] Fwd_Packet_Length_Min,
    input [7:0] Bwd_IAT_Min,
    output reg [15:0] path_length
);
    always @(*) begin
        if (URG_Flag_Count <= 0) begin
            if (Flow_IAT_Mean <= 7796) begin
                if (Packet_Length_Min <= 121) begin
                    if (Flow_IAT_Mean <= 3446) begin
                        if (Bwd_Packet_Length_Min <= 158) begin
                            if (Packet_Length_Min <= 4) begin
                                if (Bwd_IAT_Min <= 8) begin
                                    if (Fwd_IAT_Mean <= 120) begin
                                        if (Flow_IAT_Mean <= 959) begin
                                            path_length = 16'd1753;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end else begin
                                        if (Fwd_IAT_Mean <= 4835) begin
                                            path_length = 16'd1790;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end
                                end else begin
                                    if (Fwd_IAT_Mean <= 129) begin
                                        path_length = 16'd800;
                                    end else begin
                                        path_length = 16'd800;
                                    end
                                end
                            end else begin
                                if (Flow_IAT_Mean <= 804) begin
                                    if (Bwd_IAT_Min <= 22) begin
                                        if (Bwd_Packet_Length_Mean <= 87) begin
                                            path_length = 16'd1887;
                                        end else begin
                                            path_length = 16'd1853;
                                        end
                                    end else begin
                                        path_length = 16'd800;
                                    end
                                end else begin
                                    path_length = 16'd700;
                                end
                            end
                        end else begin
                            if (Fwd_IAT_Mean <= 139) begin
                                if (Fwd_Packet_Length_Min <= 52) begin
                                    if (Bwd_Packet_Length_Mean <= 207) begin
                                        if (Packet_Length_Min <= 46) begin
                                            path_length = 16'd1293;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end else begin
                                        if (Bwd_Packet_Length_Mean <= 232) begin
                                            path_length = 16'd1015;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end
                                end else begin
                                    path_length = 16'd700;
                                end
                            end else begin
                                path_length = 16'd600;
                            end
                        end
                    end else begin
                        path_length = 16'd400;
                    end
                end else begin
                    path_length = 16'd300;
                end
            end else begin
                if (Fwd_Packet_Length_Min <= 104) begin
                    path_length = 16'd300;
                end else begin
                    path_length = 16'd300;
                end
            end
        end else begin
            if (Packet_Length_Min <= 11) begin
                if (Fwd_IAT_Mean <= 1583) begin
                    if (Bwd_Packet_Length_Mean <= 1181) begin
                        if (Bwd_Packet_Length_Min <= 194) begin
                            if (Fwd_Packet_Length_Min <= 1389) begin
                                if (Packet_Length_Min <= 2) begin
                                    if (Fwd_IAT_Mean <= 419) begin
                                        if (ACK_Flag_Count <= 0) begin
                                            path_length = 16'd1964;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end else begin
                                        if (ACK_Flag_Count <= 0) begin
                                            path_length = 16'd900;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end
                                end else begin
                                    if (Fwd_Packet_Length_Min <= 33) begin
                                        if (Bwd_IAT_Min <= 30) begin
                                            path_length = 16'd1948;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end else begin
                                        if (Flow_IAT_Mean <= 17) begin
                                            path_length = 16'd900;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end
                                end
                            end else begin
                                if (Bwd_Packet_Length_Mean <= 14) begin
                                    path_length = 16'd700;
                                end else begin
                                    path_length = 16'd700;
                                end
                            end
                        end else begin
                            path_length = 16'd500;
                        end
                    end else begin
                        path_length = 16'd400;
                    end
                end else begin
                    if (Fwd_Packet_Length_Min <= 5) begin
                        if (Fwd_IAT_Mean <= 7118) begin
                            if (Fwd_IAT_Mean <= 4865) begin
                                if (Fwd_IAT_Mean <= 4223) begin
                                    if (Fwd_IAT_Mean <= 3329) begin
                                        path_length = 16'd800;
                                    end else begin
                                        if (Bwd_IAT_Min <= 1) begin
                                            path_length = 16'd1154;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end
                                end else begin
                                    if (Bwd_Packet_Length_Mean <= 228) begin
                                        path_length = 16'd800;
                                    end else begin
                                        path_length = 16'd800;
                                    end
                                end
                            end else begin
                                path_length = 16'd600;
                            end
                        end else begin
                            if (Bwd_Packet_Length_Mean <= 38) begin
                                path_length = 16'd600;
                            end else begin
                                path_length = 16'd600;
                            end
                        end
                    end else begin
                        if (Bwd_Packet_Length_Min <= 19) begin
                            if (Flow_IAT_Mean <= 2576) begin
                                if (Bwd_IAT_Min <= 1) begin
                                    if (Fwd_IAT_Mean <= 2493) begin
                                        path_length = 16'd800;
                                    end else begin
                                        if (Packet_Length_Min <= 3) begin
                                            path_length = 16'd1015;
                                        end else begin
                                            path_length = 16'd1015;
                                        end
                                    end
                                end else begin
                                    if (Fwd_IAT_Mean <= 3392) begin
                                        path_length = 16'd800;
                                    end else begin
                                        path_length = 16'd800;
                                    end
                                end
                            end else begin
                                path_length = 16'd600;
                            end
                        end else begin
                            if (Bwd_IAT_Min <= 2) begin
                                path_length = 16'd600;
                            end else begin
                                if (Flow_IAT_Mean <= 5817) begin
                                    path_length = 16'd700;
                                end else begin
                                    path_length = 16'd700;
                                end
                            end
                        end
                    end
                end
            end else begin
                path_length = 16'd200;
            end
        end
    end
endmodule

module Tree_1 (
    input [10:0] Packet_Length_Min,
    input [15:0] Flow_IAT_Mean,
    input       ACK_Flag_Count,
    input [15:0] Fwd_IAT_Mean,
    input [10:0] Bwd_Packet_Length_Min,
    input       URG_Flag_Count,
    input [11:0] Bwd_Packet_Length_Mean,
    input [11:0] Fwd_Packet_Length_Min,
    input [7:0] Bwd_IAT_Min,
    output reg [15:0] path_length
);
    always @(*) begin
        if (Bwd_Packet_Length_Mean <= 519) begin
            if (Flow_IAT_Mean <= 5561) begin
                if (Flow_IAT_Mean <= 4828) begin
                    if (ACK_Flag_Count <= 0) begin
                        if (Fwd_Packet_Length_Min <= 55) begin
                            if (Bwd_IAT_Min <= 102) begin
                                if (Flow_IAT_Mean <= 1446) begin
                                    if (Fwd_Packet_Length_Min <= 26) begin
                                        if (Packet_Length_Min <= 8) begin
                                            path_length = 16'd2098;
                                        end else begin
                                            path_length = 16'd1337;
                                        end
                                    end else begin
                                        if (Fwd_IAT_Mean <= 117) begin
                                            path_length = 16'd2008;
                                        end else begin
                                            path_length = 16'd1015;
                                        end
                                    end
                                end else begin
                                    if (Bwd_Packet_Length_Mean <= 18) begin
                                        if (Bwd_Packet_Length_Mean <= 0) begin
                                            path_length = 16'd1337;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end else begin
                                        if (Fwd_IAT_Mean <= 3566) begin
                                            path_length = 16'd1015;
                                        end else begin
                                            path_length = 16'd1154;
                                        end
                                    end
                                end
                            end else begin
                                path_length = 16'd600;
                            end
                        end else begin
                            if (Flow_IAT_Mean <= 1) begin
                                if (Packet_Length_Min <= 150) begin
                                    path_length = 16'd700;
                                end else begin
                                    path_length = 16'd815;
                                end
                            end else begin
                                if (Bwd_Packet_Length_Mean <= 235) begin
                                    if (Bwd_IAT_Min <= 2) begin
                                        path_length = 16'd800;
                                    end else begin
                                        path_length = 16'd800;
                                    end
                                end else begin
                                    path_length = 16'd700;
                                end
                            end
                        end
                    end else begin
                        if (Flow_IAT_Mean <= 681) begin
                            if (Bwd_Packet_Length_Min <= 1) begin
                                if (Bwd_Packet_Length_Mean <= 284) begin
                                    if (Bwd_Packet_Length_Mean <= 156) begin
                                        if (Bwd_IAT_Min <= 46) begin
                                            path_length = 16'd1374;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end else begin
                                        if (Bwd_Packet_Length_Mean <= 219) begin
                                            path_length = 16'd1015;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end
                                end else begin
                                    if (Bwd_Packet_Length_Mean <= 459) begin
                                        if (Fwd_IAT_Mean <= 28) begin
                                            path_length = 16'd1154;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end else begin
                                        if (Bwd_Packet_Length_Mean <= 471) begin
                                            path_length = 16'd1015;
                                        end else begin
                                            path_length = 16'd1015;
                                        end
                                    end
                                end
                            end else begin
                                path_length = 16'd600;
                            end
                        end else begin
                            if (Bwd_IAT_Min <= 0) begin
                                if (Fwd_IAT_Mean <= 3033) begin
                                    if (Flow_IAT_Mean <= 1497) begin
                                        if (Flow_IAT_Mean <= 1058) begin
                                            path_length = 16'd1293;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end else begin
                                        if (Fwd_IAT_Mean <= 1759) begin
                                            path_length = 16'd1015;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end
                                end else begin
                                    if (Bwd_Packet_Length_Mean <= 166) begin
                                        if (Flow_IAT_Mean <= 3568) begin
                                            path_length = 16'd900;
                                        end else begin
                                            path_length = 16'd1015;
                                        end
                                    end else begin
                                        if (Bwd_Packet_Length_Mean <= 205) begin
                                            path_length = 16'd1015;
                                        end else begin
                                            path_length = 16'd1235;
                                        end
                                    end
                                end
                            end else begin
                                if (Flow_IAT_Mean <= 1211) begin
                                    if (Bwd_Packet_Length_Mean <= 272) begin
                                        if (Fwd_IAT_Mean <= 430) begin
                                            path_length = 16'd1476;
                                        end else begin
                                            path_length = 16'd1293;
                                        end
                                    end else begin
                                        path_length = 16'd800;
                                    end
                                end else begin
                                    if (Flow_IAT_Mean <= 2635) begin
                                        if (Bwd_Packet_Length_Mean <= 13) begin
                                            path_length = 16'd1015;
                                        end else begin
                                            path_length = 16'd1615;
                                        end
                                    end else begin
                                        path_length = 16'd800;
                                    end
                                end
                            end
                        end
                    end
                end else begin
                    path_length = 16'd300;
                end
            end else begin
                path_length = 16'd200;
            end
        end else begin
            if (Bwd_IAT_Min <= 1) begin
                if (Bwd_IAT_Min <= 0) begin
                    if (Bwd_Packet_Length_Min <= 0) begin
                        if (Bwd_Packet_Length_Mean <= 859) begin
                            if (Bwd_Packet_Length_Mean <= 682) begin
                                path_length = 16'd600;
                            end else begin
                                if (Bwd_Packet_Length_Mean <= 744) begin
                                    path_length = 16'd700;
                                end else begin
                                    path_length = 16'd700;
                                end
                            end
                        end else begin
                            if (Bwd_Packet_Length_Mean <= 900) begin
                                if (Flow_IAT_Mean <= 510) begin
                                    if (Flow_IAT_Mean <= 253) begin
                                        path_length = 16'd800;
                                    end else begin
                                        path_length = 16'd800;
                                    end
                                end else begin
                                    path_length = 16'd700;
                                end
                            end else begin
                                path_length = 16'd600;
                            end
                        end
                    end else begin
                        path_length = 16'd400;
                    end
                end else begin
                    if (URG_Flag_Count <= 0) begin
                        if (Fwd_IAT_Mean <= 1994) begin
                            if (Bwd_Packet_Length_Min <= 1) begin
                                if (Fwd_IAT_Mean <= 467) begin
                                    if (Fwd_IAT_Mean <= 65) begin
                                        if (Bwd_Packet_Length_Mean <= 1237) begin
                                            path_length = 16'd900;
                                        end else begin
                                            path_length = 16'd1015;
                                        end
                                    end else begin
                                        if (Fwd_IAT_Mean <= 201) begin
                                            path_length = 16'd1015;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end
                                end else begin
                                    if (Fwd_IAT_Mean <= 744) begin
                                        if (Flow_IAT_Mean <= 249) begin
                                            path_length = 16'd900;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end else begin
                                        if (Fwd_IAT_Mean <= 1343) begin
                                            path_length = 16'd1154;
                                        end else begin
                                            path_length = 16'd1015;
                                        end
                                    end
                                end
                            end else begin
                                path_length = 16'd600;
                            end
                        end else begin
                            if (Flow_IAT_Mean <= 1748) begin
                                if (Fwd_IAT_Mean <= 3223) begin
                                    path_length = 16'd700;
                                end else begin
                                    path_length = 16'd700;
                                end
                            end else begin
                                path_length = 16'd600;
                            end
                        end
                    end else begin
                        if (Packet_Length_Min <= 1) begin
                            path_length = 16'd500;
                        end else begin
                            path_length = 16'd500;
                        end
                    end
                end
            end else begin
                if (Bwd_Packet_Length_Mean <= 863) begin
                    if (Flow_IAT_Mean <= 164) begin
                        if (Bwd_Packet_Length_Mean <= 620) begin
                            if (Flow_IAT_Mean <= 4) begin
                                path_length = 16'd600;
                            end else begin
                                path_length = 16'd600;
                            end
                        end else begin
                            path_length = 16'd500;
                        end
                    end else begin
                        path_length = 16'd400;
                    end
                end else begin
                    if (ACK_Flag_Count <= 0) begin
                        path_length = 16'd400;
                    end else begin
                        if (Bwd_Packet_Length_Mean <= 974) begin
                            path_length = 16'd500;
                        end else begin
                            if (Flow_IAT_Mean <= 580) begin
                                path_length = 16'd600;
                            end else begin
                                path_length = 16'd600;
                            end
                        end
                    end
                end
            end
        end
    end
endmodule

module Tree_2 (
    input [10:0] Packet_Length_Min,
    input [15:0] Flow_IAT_Mean,
    input       ACK_Flag_Count,
    input [15:0] Fwd_IAT_Mean,
    input [10:0] Bwd_Packet_Length_Min,
    input       URG_Flag_Count,
    input [11:0] Bwd_Packet_Length_Mean,
    input [11:0] Fwd_Packet_Length_Min,
    input [7:0] Bwd_IAT_Min,
    output reg [15:0] path_length
);
    always @(*) begin
        if (Bwd_IAT_Min <= 66) begin
            if (URG_Flag_Count <= 0) begin
                if (Bwd_IAT_Min <= 27) begin
                    if (Packet_Length_Min <= 229) begin
                        if (Fwd_Packet_Length_Min <= 37) begin
                            if (Fwd_Packet_Length_Min <= 23) begin
                                if (Fwd_IAT_Mean <= 6011) begin
                                    if (Fwd_Packet_Length_Min <= 15) begin
                                        if (Bwd_Packet_Length_Min <= 5) begin
                                            path_length = 16'd1959;
                                        end else begin
                                            path_length = 16'd1015;
                                        end
                                    end else begin
                                        path_length = 16'd1135;
                                    end
                                end else begin
                                    path_length = 16'd700;
                                end
                            end else begin
                                if (Fwd_Packet_Length_Min <= 35) begin
                                    if (Fwd_IAT_Mean <= 6) begin
                                        if (Bwd_Packet_Length_Mean <= 196) begin
                                            path_length = 16'd1838;
                                        end else begin
                                            path_length = 16'd1235;
                                        end
                                    end else begin
                                        path_length = 16'd800;
                                    end
                                end else begin
                                    if (Flow_IAT_Mean <= 1) begin
                                        path_length = 16'd800;
                                    end else begin
                                        if (Packet_Length_Min <= 36) begin
                                            path_length = 16'd900;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end
                                end
                            end
                        end else begin
                            if (Fwd_Packet_Length_Min <= 140) begin
                                if (Flow_IAT_Mean <= 148) begin
                                    if (Packet_Length_Min <= 46) begin
                                        if (Packet_Length_Min <= 42) begin
                                            path_length = 16'd1743;
                                        end else begin
                                            path_length = 16'd1743;
                                        end
                                    end else begin
                                        if (Packet_Length_Min <= 50) begin
                                            path_length = 16'd1495;
                                        end else begin
                                            path_length = 16'd1337;
                                        end
                                    end
                                end else begin
                                    path_length = 16'd700;
                                end
                            end else begin
                                path_length = 16'd600;
                            end
                        end
                    end else begin
                        path_length = 16'd400;
                    end
                end else begin
                    if (Bwd_Packet_Length_Min <= 74) begin
                        if (Fwd_Packet_Length_Min <= 42) begin
                            path_length = 16'd500;
                        end else begin
                            path_length = 16'd500;
                        end
                    end else begin
                        path_length = 16'd400;
                    end
                end
            end else begin
                if (Fwd_Packet_Length_Min <= 935) begin
                    if (Fwd_IAT_Mean <= 6755) begin
                        if (Flow_IAT_Mean <= 1870) begin
                            if (Packet_Length_Min <= 14) begin
                                if (Flow_IAT_Mean <= 124) begin
                                    if (Fwd_IAT_Mean <= 116) begin
                                        if (Fwd_IAT_Mean <= 29) begin
                                            path_length = 16'd2070;
                                        end else begin
                                            path_length = 16'd1015;
                                        end
                                    end else begin
                                        path_length = 16'd800;
                                    end
                                end else begin
                                    if (Flow_IAT_Mean <= 935) begin
                                        if (Packet_Length_Min <= 0) begin
                                            path_length = 16'd1015;
                                        end else begin
                                            path_length = 16'd1015;
                                        end
                                    end else begin
                                        if (Fwd_Packet_Length_Min <= 2) begin
                                            path_length = 16'd1015;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end
                                end
                            end else begin
                                path_length = 16'd600;
                            end
                        end else begin
                            if (Fwd_IAT_Mean <= 2895) begin
                                path_length = 16'd600;
                            end else begin
                                if (Fwd_IAT_Mean <= 4668) begin
                                    if (Bwd_IAT_Min <= 0) begin
                                        path_length = 16'd800;
                                    end else begin
                                        if (Fwd_IAT_Mean <= 3966) begin
                                            path_length = 16'd900;
                                        end else begin
                                            path_length = 16'd1154;
                                        end
                                    end
                                end else begin
                                    path_length = 16'd700;
                                end
                            end
                        end
                    end else begin
                        if (Fwd_IAT_Mean <= 7962) begin
                            if (Fwd_IAT_Mean <= 7568) begin
                                path_length = 16'd600;
                            end else begin
                                path_length = 16'd600;
                            end
                        end else begin
                            path_length = 16'd500;
                        end
                    end
                end else begin
                    path_length = 16'd300;
                end
            end
        end else begin
            if (Bwd_IAT_Min <= 76) begin
                path_length = 16'd200;
            end else begin
                path_length = 16'd200;
            end
        end
    end
endmodule

module Tree_3 (
    input [10:0] Packet_Length_Min,
    input [15:0] Flow_IAT_Mean,
    input       ACK_Flag_Count,
    input [15:0] Fwd_IAT_Mean,
    input [10:0] Bwd_Packet_Length_Min,
    input       URG_Flag_Count,
    input [11:0] Bwd_Packet_Length_Mean,
    input [11:0] Fwd_Packet_Length_Min,
    input [7:0] Bwd_IAT_Min,
    output reg [15:0] path_length
);
    always @(*) begin
        if (Packet_Length_Min <= 85) begin
            if (Bwd_Packet_Length_Min <= 57) begin
                if (Bwd_IAT_Min <= 11) begin
                    if (Bwd_Packet_Length_Mean <= 1208) begin
                        if (Bwd_Packet_Length_Min <= 46) begin
                            if (Packet_Length_Min <= 35) begin
                                if (ACK_Flag_Count <= 0) begin
                                    if (Bwd_IAT_Min <= 4) begin
                                        if (Flow_IAT_Mean <= 3710) begin
                                            path_length = 16'd2098;
                                        end else begin
                                            path_length = 16'd1154;
                                        end
                                    end else begin
                                        path_length = 16'd800;
                                    end
                                end else begin
                                    if (Flow_IAT_Mean <= 2483) begin
                                        if (Bwd_Packet_Length_Min <= 0) begin
                                            path_length = 16'd1922;
                                        end else begin
                                            path_length = 16'd1293;
                                        end
                                    end else begin
                                        if (Bwd_Packet_Length_Mean <= 270) begin
                                            path_length = 16'd900;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end
                                end
                            end else begin
                                if (Fwd_IAT_Mean <= 52) begin
                                    path_length = 16'd700;
                                end else begin
                                    path_length = 16'd700;
                                end
                            end
                        end else begin
                            if (Bwd_Packet_Length_Mean <= 67) begin
                                if (Fwd_Packet_Length_Min <= 33) begin
                                    if (Fwd_Packet_Length_Min <= 28) begin
                                        if (Packet_Length_Min <= 25) begin
                                            path_length = 16'd900;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end else begin
                                        if (Packet_Length_Min <= 32) begin
                                            path_length = 16'd1405;
                                        end else begin
                                            path_length = 16'd1015;
                                        end
                                    end
                                end else begin
                                    if (Fwd_Packet_Length_Min <= 34) begin
                                        path_length = 16'd800;
                                    end else begin
                                        if (Bwd_IAT_Min <= 2) begin
                                            path_length = 16'd1476;
                                        end else begin
                                            path_length = 16'd1154;
                                        end
                                    end
                                end
                            end else begin
                                if (Packet_Length_Min <= 26) begin
                                    path_length = 16'd700;
                                end else begin
                                    if (Bwd_Packet_Length_Mean <= 120) begin
                                        path_length = 16'd800;
                                    end else begin
                                        path_length = 16'd800;
                                    end
                                end
                            end
                        end
                    end else begin
                        if (Fwd_IAT_Mean <= 945) begin
                            if (Bwd_IAT_Min <= 0) begin
                                if (Bwd_Packet_Length_Mean <= 1676) begin
                                    if (Fwd_IAT_Mean <= 15) begin
                                        path_length = 16'd800;
                                    end else begin
                                        path_length = 16'd800;
                                    end
                                end else begin
                                    path_length = 16'd700;
                                end
                            end else begin
                                if (Fwd_IAT_Mean <= 24) begin
                                    if (Fwd_IAT_Mean <= 18) begin
                                        path_length = 16'd800;
                                    end else begin
                                        path_length = 16'd800;
                                    end
                                end else begin
                                    if (Flow_IAT_Mean <= 44) begin
                                        if (Flow_IAT_Mean <= 27) begin
                                            path_length = 16'd900;
                                        end else begin
                                            path_length = 16'd1015;
                                        end
                                    end else begin
                                        if (Flow_IAT_Mean <= 100) begin
                                            path_length = 16'd900;
                                        end else begin
                                            path_length = 16'd1154;
                                        end
                                    end
                                end
                            end
                        end else begin
                            path_length = 16'd500;
                        end
                    end
                end else begin
                    if (Packet_Length_Min <= 19) begin
                        if (Bwd_IAT_Min <= 22) begin
                            path_length = 16'd500;
                        end else begin
                            if (Flow_IAT_Mean <= 416) begin
                                if (Bwd_IAT_Min <= 47) begin
                                    if (Flow_IAT_Mean <= 191) begin
                                        path_length = 16'd800;
                                    end else begin
                                        path_length = 16'd800;
                                    end
                                end else begin
                                    if (Bwd_IAT_Min <= 48) begin
                                        path_length = 16'd800;
                                    end else begin
                                        if (Flow_IAT_Mean <= 8) begin
                                            path_length = 16'd900;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end
                                end
                            end else begin
                                if (Fwd_IAT_Mean <= 726) begin
                                    path_length = 16'd700;
                                end else begin
                                    path_length = 16'd700;
                                end
                            end
                        end
                    end else begin
                        path_length = 16'd400;
                    end
                end
            end else begin
                if (Fwd_IAT_Mean <= 3069) begin
                    if (URG_Flag_Count <= 0) begin
                        if (Flow_IAT_Mean <= 88) begin
                            if (Bwd_Packet_Length_Min <= 159) begin
                                if (Bwd_Packet_Length_Mean <= 66) begin
                                    if (Fwd_Packet_Length_Min <= 31) begin
                                        if (Bwd_Packet_Length_Min <= 59) begin
                                            path_length = 16'd1154;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end else begin
                                        if (Bwd_IAT_Min <= 44) begin
                                            path_length = 16'd1634;
                                        end else begin
                                            path_length = 16'd1015;
                                        end
                                    end
                                end else begin
                                    if (Fwd_Packet_Length_Min <= 48) begin
                                        if (Packet_Length_Min <= 42) begin
                                            path_length = 16'd1753;
                                        end else begin
                                            path_length = 16'd1709;
                                        end
                                    end else begin
                                        if (Flow_IAT_Mean <= 6) begin
                                            path_length = 16'd1293;
                                        end else begin
                                            path_length = 16'd1015;
                                        end
                                    end
                                end
                            end else begin
                                if (Packet_Length_Min <= 55) begin
                                    if (Bwd_Packet_Length_Min <= 210) begin
                                        if (Bwd_Packet_Length_Min <= 197) begin
                                            path_length = 16'd1015;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end else begin
                                        if (Flow_IAT_Mean <= 11) begin
                                            path_length = 16'd1293;
                                        end else begin
                                            path_length = 16'd900;
                                        end
                                    end
                                end else begin
                                    path_length = 16'd700;
                                end
                            end
                        end else begin
                            path_length = 16'd500;
                        end
                    end else begin
                        path_length = 16'd400;
                    end
                end else begin
                    path_length = 16'd300;
                end
            end
        end else begin
            if (Fwd_IAT_Mean <= 685) begin
                if (Fwd_Packet_Length_Min <= 96) begin
                    path_length = 16'd300;
                end else begin
                    path_length = 16'd415;
                end
            end else begin
                if (Flow_IAT_Mean <= 6570) begin
                    path_length = 16'd300;
                end else begin
                    path_length = 16'd300;
                end
            end
        end
    end
endmodule

module IDS_Top (
    input [10:0] Packet_Length_Min,
    input [15:0] Flow_IAT_Mean,
    input       ACK_Flag_Count,
    input [15:0] Fwd_IAT_Mean,
    input [10:0] Bwd_Packet_Length_Min,
    input       URG_Flag_Count,
    input [11:0] Bwd_Packet_Length_Mean,
    input [11:0] Fwd_Packet_Length_Min,
    input [7:0] Bwd_IAT_Min,
    output alert
);

    wire [15:0] score_tree_0;
    wire [15:0] score_tree_1;
    wire [15:0] score_tree_2;
    wire [15:0] score_tree_3;

    Tree_0 t0 (
        .Packet_Length_Min(Packet_Length_Min),
        .Flow_IAT_Mean(Flow_IAT_Mean),
        .ACK_Flag_Count(ACK_Flag_Count),
        .Fwd_IAT_Mean(Fwd_IAT_Mean),
        .Bwd_Packet_Length_Min(Bwd_Packet_Length_Min),
        .URG_Flag_Count(URG_Flag_Count),
        .Bwd_Packet_Length_Mean(Bwd_Packet_Length_Mean),
        .Fwd_Packet_Length_Min(Fwd_Packet_Length_Min),
        .Bwd_IAT_Min(Bwd_IAT_Min),
        .path_length(score_tree_0)
    );

    Tree_1 t1 (
        .Packet_Length_Min(Packet_Length_Min),
        .Flow_IAT_Mean(Flow_IAT_Mean),
        .ACK_Flag_Count(ACK_Flag_Count),
        .Fwd_IAT_Mean(Fwd_IAT_Mean),
        .Bwd_Packet_Length_Min(Bwd_Packet_Length_Min),
        .URG_Flag_Count(URG_Flag_Count),
        .Bwd_Packet_Length_Mean(Bwd_Packet_Length_Mean),
        .Fwd_Packet_Length_Min(Fwd_Packet_Length_Min),
        .Bwd_IAT_Min(Bwd_IAT_Min),
        .path_length(score_tree_1)
    );

    Tree_2 t2 (
        .Packet_Length_Min(Packet_Length_Min),
        .Flow_IAT_Mean(Flow_IAT_Mean),
        .ACK_Flag_Count(ACK_Flag_Count),
        .Fwd_IAT_Mean(Fwd_IAT_Mean),
        .Bwd_Packet_Length_Min(Bwd_Packet_Length_Min),
        .URG_Flag_Count(URG_Flag_Count),
        .Bwd_Packet_Length_Mean(Bwd_Packet_Length_Mean),
        .Fwd_Packet_Length_Min(Fwd_Packet_Length_Min),
        .Bwd_IAT_Min(Bwd_IAT_Min),
        .path_length(score_tree_2)
    );

    Tree_3 t3 (
        .Packet_Length_Min(Packet_Length_Min),
        .Flow_IAT_Mean(Flow_IAT_Mean),
        .ACK_Flag_Count(ACK_Flag_Count),
        .Fwd_IAT_Mean(Fwd_IAT_Mean),
        .Bwd_Packet_Length_Min(Bwd_Packet_Length_Min),
        .URG_Flag_Count(URG_Flag_Count),
        .Bwd_Packet_Length_Mean(Bwd_Packet_Length_Mean),
        .Fwd_Packet_Length_Min(Fwd_Packet_Length_Min),
        .Bwd_IAT_Min(Bwd_IAT_Min),
        .path_length(score_tree_3)
    );

    wire [31:0] total_score;
    assign total_score = score_tree_0 + score_tree_1 + score_tree_2 + score_tree_3;

    assign alert = (total_score <= 32'd4730) ? 1'b1 : 1'b0;

endmodule
