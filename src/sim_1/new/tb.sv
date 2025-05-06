`timescale 1ns / 1ps

module tb();
logic [15:0]instruction;
logic [7:0]data0, data1, out0, out1, out2, out3;
logic of, zf;

top dut(instruction, data0, data1, out0, out1, out2, out3, of, zf);
initial begin
    instruction = 0;
    data0 = 0;
    data1 = 0;
    #10
        instruction = 16'b1111111111111111;
    #10
        data0 = 255;
        data1 = 255;
    #10
        instruction = 16'b0000100000000000;
        data0 = 1;
        data1 = 1;
    #5
        data0 = 75;
    #5
        data1 = 25;
    #10
        $stop;
end
endmodule
