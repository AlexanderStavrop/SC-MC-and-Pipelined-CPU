# Single-and-Multi-Cycle-CPU

This project is about creating a single-cycle, a multi-cycle and a pipelined cpu using VHDL

The project consists of 5 Phases 
  - <a href="https://github.com/AlexanderStavrop/Single-and-Multi-Cycle-CPU/blob/master/README.md#phase-1">Phase 1</a>,
    <a href="https://github.com/AlexanderStavrop/Single-and-Multi-Cycle-CPU/blob/master/README.md#phase-2">Phase 2</a>,
    <a href="https://github.com/AlexanderStavrop/Single-and-Multi-Cycle-CPU/blob/master/README.md#phase-3">Phase 3</a> are about the single-cycle cpu
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

For the Register File, we need to create a Register module that can hold 32 bits. The register has synchronous write and asynchronous read.
![image](https://user-images.githubusercontent.com/56675566/168843307-f261eaea-8f6c-491a-8385-3d398f5aadd9.png)

Also, a Decoder 5 to 32 bits module is created for the write enable of the registers. According to the 5 bit input, corresponding to the register number we want, a string of bits is created where the bit at index equal to the register number is '1' and all others are '0'.

Lastly, a Mux is created. The Mux gets array of 32 arrays, each 32 bits, as input and outputs 32 bits. The selection happens through the decicated select signal.


Using the above components, we create the Register File module

![image](https://user-images.githubusercontent.com/56675566/168846080-8f96f9a7-fd41-4e8f-b3f1-ba0086834559.png)

## Phase 2
## Phase 3
## Phase 4
## Phase 5
