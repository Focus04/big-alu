`timescale 1ns / 1ps

module special
(
    input logic [7:0]in0, in1,
    output logic out
);

always_comb begin
    if (in0[0] == in0[7] && in0[7] == in1[0] && in1[0] == in1[7]) out = 1;
    else out = 0;
end
endmodule
