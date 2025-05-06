`timescale 1ns / 1ps

module top
(
    input logic [15:0]instruction,
    input logic [7:0]data0, data1,
    output logic [7:0]out0, out1, out2, out3,
    output logic of, zf
);

logic [7:0] w0, w1, w2, w3, w4, w5, w6, out_mux0, out_mux1, out_mux2;
logic special_out;
shift_right shift_right(data0, data1, w0);
shift_left shift_left(data0, data1, w1);
add add(data0, data1, w2, of);
sub sub(data0, data1, w3);
and_gate and_gate(data0, data1, w4);
or_gate or_gate(data0, data1, w5);
xor_gate xor_gate(data0, data1, w6);
mux4 mux0(w0, w1, w2, w3, instruction[11:10], out_mux0);
mux4 mux1(w4, w5, w6, 1, instruction[11:10], out_mux1);
special special(data0, data1, special_out);
mux4 mux2(out_mux0, out_mux1, 0, { 7'b0000_000, special_out }, instruction[13:12], out_mux2);
demux4 demux(out_mux2, instruction[15:14], out0, out1, out2, out3);
comp_eq comp(out_mux2, 0, zf);
endmodule
