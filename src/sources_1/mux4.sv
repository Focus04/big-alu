`timescale 1ns / 1ps

module mux4
(
    input logic [7:0]in0, in1, in2, in3,
    input logic [1:0]sel,
    output logic [7:0]out0
);

always_comb begin
    case (sel)
        0: out0 = in0;
        1: out0 = in1;
        2: out0 = in2;
        3: out0 = in3;
    endcase
end
endmodule
