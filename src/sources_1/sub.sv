`timescale 1ns / 1ps

module sub
(
    input logic [7:0]in0, in1,
    output logic [7:0]out0
);

assign out0 = in0 - in1;
endmodule
