`timescale 1ns / 1ps

module add
(
    input logic [7:0]in0, in1,
    output logic [7:0]out0,
    output logic cf
);

assign { cf, out0 } = in0 + in1;
endmodule
