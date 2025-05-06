`timescale 1ns / 1ps

module comp_eq
(
    input logic [7:0] in0, in1,
    output logic out0
);

always_comb begin
    if (in0 == in1) out0 = 1;
    else out0 = 0;
end
endmodule
