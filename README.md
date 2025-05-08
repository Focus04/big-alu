# Processor-like ALU

## Overview
This project implements a configurable arithmetic logic unit (ALU) with multiple operations selectable via a 16-bit instruction input. It processes two 8-bit data inputs and produces four 8-bit outputs, along with status flags.

## Module Hierarchy
```
top.sv  
├── shift_right.sv  
├── shift_left.sv  
├── add.sv  
├── sub.sv  
├── and_gate.sv  
├── or_gate.sv  
├── xor_gate.sv  
├── special.sv  
├── comp_eq.sv  
├── mux4.sv  
└── demux4.sv
```

## Inputs and Outputs

### Inputs:
- `instruction[15:0]`: 16-bit control word  
- `data0[7:0]`: First 8-bit data input  
- `data1[7:0]`: Second 8-bit data input  

### Outputs:
- `out0[7:0]` to `out3[7:0]`: Four 8-bit output channels  
- `of`: Overflow flag (from addition operation)  
- `zf`: Zero flag (output is zero)  

## Instruction Decoding

### Output Selection (`instruction[15:14]`):
- `00`: Route to `out0`  
- `01`: Route to `out1`  
- `10`: Route to `out2`  
- `11`: Route to `out3`  

### Operation Category Selection (`instruction[13:12]`):
- `00`: Arithmetic operations (mux0 output)  
- `01`: Logical operations (mux1 output)  
- `10`: Constant zero  
- `11`: Special operation result  

### Operation Selection within Category (`instruction[11:10]`):

#### For Arithmetic operations (mux0):
- `00`: Right shift  
- `01`: Left shift  
- `10`: Addition  
- `11`: Subtraction  

#### For Logical operations (mux1):
- `00`: AND  
- `01`: OR  
- `10`: XOR  
- `11`: Constant 1  

## Supported Operations

### Shift Operations:
- Right shift: `data0 >> data1`  
- Left shift: `data0 << data1`  

### Arithmetic Operations:
- Addition: `data0 + data1` (with overflow flag)  
- Subtraction: `data0 - data1`  

### Logical Operations:
- Bitwise AND: `data0 & data1`  
- Bitwise OR: `data0 | data1`  
- Bitwise XOR: `data0 ^ data1`  

### Special Operation:
- Checks if all four corner bits (LSB and MSB of both inputs) are equal  
- Returns `1` if true, `0` otherwise  

### Other:
- Constant `0` output  
- Constant `1` output (via logical operations only)  

## Status Flags
- `of`: Overflow Flag – Set when addition operation overflows  
- `zf`: Zero Flag – Set when the selected output equals zero  

## Example Usage

The following test bench module can be found within the source code and can be simulated with software such as Vivado.
```verilog
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
```

## Timing
- All operations are combinational and complete in zero time  
- Timescale: `1ns/1ps` precision  

## Dependencies
- SystemVerilog-compliant simulator (Vivado, ModelSim, VCS)  
- All source files must be compiled together  

## Limitation
This is purely a combinational circuit and has no clock input.
