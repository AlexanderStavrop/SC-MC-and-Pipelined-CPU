# Phase 1

In this phase hte ALU and the Register File modules are created.

## ALU
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

## RegisterFile
The Register File holds the registers and is responsible for writing and reading data to them. 

![image](https://user-images.githubusercontent.com/56675566/168846080-8f96f9a7-fd41-4e8f-b3f1-ba0086834559.png)

**Inputs and Outputs**
| Signal |  Type  | Bit Length |  Description                                     |   
|  :-:   |  :-:   |     :-:  	 |        :-  	                                    |
|  CLK   | Input  |    1 Bit   | Clock pulse input                                |
|  Reset | Input  |    1 Bit   | Reset signal input                               |
|  WrEn  | Input  |    1 Bit   | Write enable of register file                    |
|  Ard1  | Input  |    5 Bits  | Select signal of the first Mux                   |
|  Ard2  | Input  |    5 Bits  | Select signal of the second Mux                  |
|  AWR   | Input  |    5 Bits  | Balue selecting which register has Write enable  |
|  Din   | Input  |   32 Bits  | Data to be writen in a register                  |
|  Dout1 | Output |   32 Bits  | Value of the first selected Register             |
|  Dout2 | Output |   32 Bits  | Value of the first selected Register             |


The Register File module consists of 1 Decoder 5 to 32, 2 Muxes and 32 32 bit Registers.
- **Decoder5to32:** This module is responsible for the write enable of the registers. According to the 5 bit input, corresponding to the register number we want, a string of bits is created where the bit at index equal to the register number is '1' and all others are '0'. The output of the Decoder has a 10ns delay.
- **GenericMux:** This module gets array of 32 arrays, each 32 bits, as input and outputs 32 bits. The selection happens through the decicated select signal. The output of the Mux has a 10ns delay.
- **Register32:** This module can hold 32 bits, has synchronous write and asynchronous read. The output of the register has a 10ns delay. 
  
  ![image](https://user-images.githubusercontent.com/56675566/168843307-f261eaea-8f6c-491a-8385-3d398f5aadd9.png)

The Register R0 has always the value of 0 and this can not change.
