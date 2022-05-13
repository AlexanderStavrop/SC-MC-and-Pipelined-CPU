# Single-and-Multi-Cycle-CPU

This project is about creating a single-cycle, a multi-cycle and a pipelined cpu using VHDL

The project consists of 5 Phases 
  - Phase 1 through 3 are about the single-cycle cpu
  - Phase 4 is about the Multi-Cycle cpu
  - Phase 5 is about the Pipelined cpu

The Cpu is created based on the instruction set CHARIS
![image](https://user-images.githubusercontent.com/56675566/167747415-19aa0df1-ead7-447a-8ff4-63270c4d6872.png)

<br></br>
## <a href="https://github.com/AlexanderStavrop/Single-and-Multi-Cycle-CPU/tree/master/Phase_1">Phase 1</a>

In this phase hte ALU and the Register File modules are created.

### ALU
The ALU module executes all the logic and arithmetic operations. 

**Inputs and Outputs**
| Signal |  Type  | Bit Length |  Description                             |   
| :-:    |  :-:   |     :-:  	 |        :-  	                            |
|  A     | Input  |   32 Bits  | 1st Input                                |
|  B     | Input  |   32 Bits  | 2nd Input                                |
|  OP    | Input  |    4 Bits  | Operation code                           |
|  Dout  | Output |   32 Bits  | Result of operation                      |
|  Zero  | Output |    1 Bits  | Flag indicating the result is equal to 0 |
|  Cout  | Output |    1 Bits  | Flag indicating there is Carry out       |
|  Ovf   | Output |    1 Bits  | Flag indicating there is Overflow        |
- The Dout, the zero, the Cout and the Ovf outputs have 10ns delay to simulate the real behavior
 <br></br>

**The ALU operations**
| OpCode | Operation              | Description                    |
|  :-:   |    :-                  |     :-:  	                     | 
|  0000  | Addition               | A + B                          | 
|  0001  | Subtraction            | A - B                          |
|  0010  | Logic AND              | A && B                         |
|  0011  | Logic OR               | A \|\| B                       |
|  0100  | Logic NOT A            | !A                             | 
|  0101  | Logic NAND             | !(A && B)                      |
|  0110  | Logic NOR              | !(A \|\| B)                    |
|  1000  | Arithmetic Right Shift | A[31], A[31], ..., A[1]        |
|  1001  | Logic Right Shift      |   0  , A[31], ..., A[1]        |
|  1010  | Logic Left Shift       | A[30], A[29], ..., A[0],   0   |         
|  1100  | Left Rotation          | A[30], A[29], ..., A[0], A[31] |
|  1101  | Right Rotation         | A[0] , A[31], ..., A[2], A[1]  |

### RegisterFile

## Phase 2
## Phase 3
## Phase 4
## Phase 5
