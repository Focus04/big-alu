`timescale 1ns / 1ps

module demux4
(
    input logic [7:0]in0,
    input logic [1:0]sel,
    output logic [7:0]out0, out1, out2, out3
);

always_comb begin
    out0 = 0;
    out1 = 0;
    out2 = 0;
    out3 = 0;
    case (sel)
        0: out0 = in0;
        1: out1 = in0;
        2: out2 = in0;
        3: out3 = in0;
    endcase
end
endmodule
