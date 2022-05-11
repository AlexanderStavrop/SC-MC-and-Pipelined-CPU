# Single-and-Multi-Cycle-CPU

This project is about creating a single-cycle, a multi-cycle and a pipelined cpu using VHDL

The project consists of 5 Phases 
  - Phase 1 through 3 are about the single-cycle cpu
  - Phase 4 is about the Multi-Cycle cpu
  - Phase 5 is about the Pipelined cpu

The Cpu is created based on the instruction set CHARIS
![image](https://user-images.githubusercontent.com/56675566/167747415-19aa0df1-ead7-447a-8ff4-63270c4d6872.png)

## Phase 1
In this phase hte ALU and the Register File modules are created.

### ALU
The ALU module executes all the logic and arithmetic operations. 
| Signal |  Type  | Bit Length |  Description                             |
| :-:    |  :-:   |     :-:  	 |        :-  	                            | 
|  A     | Input  |   32 Bits  | 1st Input                                | 
|  B     | Input  |   32 Bits  | 2nd Input                                |
|  OP    | Input  |    4 Bits  | Operation code                           |
|  Dout  | Output |   32 Bits  | Result of operation                      |
|  Zero  | Output |    1 Bits  | Flag indicating the result is equal to 0 |
|  Cout  | Output |    1 Bits  | Flag indicating there is Carry out       |
|  Ovf   | Output |    1 Bits  | Flag indicating there is Overflow        |


### RegisterFile


## Phase 2
## Phase 3
## Phase 4
## Phase 5
