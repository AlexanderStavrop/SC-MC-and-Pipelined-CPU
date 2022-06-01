# Single Cycle - Multi Cycle - Pipelined CPU

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
## <a href="https://github.com/AlexanderStavrop/Single-and-Multi-Cycle-CPU/tree/master/Phase_2">Phase 2</a>

In these phase the Ram, IFSTAGE, DECSTAGE, EXSTAGE and MEMSTAGE modules are created.

### IFSTAGE 
The instruction fetch unit is responsible for calculating the memory address where the desired instruction is stored. The module consists of 2 adders, 1 Mux and 1 register.

![image](https://user-images.githubusercontent.com/56675566/168852709-897d5557-9144-400f-a023-e5dc68ab4610.png)

**Inputs and Outputs**
| Signal    |  Type  | Bit Length |  Description                                     |   
|  :-:      |  :-:   |     :-:  	|        :-  	                                     | 
|  CLK      | Input  |    1 Bit   | Clock pulse input                                |
|  Reset    | Input  |    1 Bit   | Reset signal input                               |
|  PC_sel   | Input  |    1 Bit   | Select signal of the Mux                         |
|  PC_LdEn  | Input  |    1 Bit   | Write enable signal of the PC register           |
|  PC_Immed | Input  |   32 Bits  | Value of Immediate extended in 32 bits           |
|  PC 	    | Output |   32 Bits  | Value of PC                                      |

- **Adder4:** This module has one 32 bit input and is responsible for adding 4 to the value of PC (PC+4). The output of the adder has a 10ns delay.
- **Adder32:** This module has two 32 bit inputs and is responsible for adding the value of (PC+4) and the value of Immediate (from DECSTAGE). The output of the adder has a 10ns delay.
- **Mux32:** This module has two 32 bit inputs, one for each adder result and the output is selected with the dedicated select signal. The output of the Mux has a 10ns delay.
- **Register32:** This module is the same as the one created in Phase 1.

### DECSTAGE 
The Decode unit is responsible for using the instruction to select the registers needed for the execution of the operation and extending the value of Immed to 32 bits. The module consists of 2 Muxes, the Register File created in phase 1 and the Immed16to32 module.

![image](https://user-images.githubusercontent.com/56675566/168861593-ae8c244b-a304-40b4-8ac2-b1f9c66b7e10.png)

**Inputs and Outputs**
| Signal         |  Type  | Bit Length |  Description                                                                                     |   
|  :-:           |  :-:   |     :-:  	|        :-  	                                                                                      | 
|  CLK           | Input  |    1 Bit   | Clock pulse input                                                                                |
|  Reset         | Input  |    1 Bit   | Reset signal input                                                                               |
|  RF_WrEn       | Input  |    1 Bit   | Write enable signal of Register File                                                             |
|  RF_B_sel      | Input  |    1 Bit   | Select signal for the Mux that chooses between the Rt and Rd register                            |
|  RF_WrData_sel | Input  |    1 Bit   | Select signal for the Mux that chooses between the result of the ALU and the Data for the Memory |
|  immExt        | Input  |    2 Bits  | Select signal for the module performing the 32 bits extend of the Immediate value                |
|  Instr         | Input  |   32 Bits  | Current instruction from the memory                                                              |
|  ALU_out       | Input  |   32 Bits  | Result of ALU                                                                                    |
|  MEM_out 			 | Input  |   32 Bits  | Data read from Memory                                                                            |
|  Immed 	       | Output |   32 Bits  | Immed value extended to 32 bits                                                                  |
|  RF_A 	       | Output |   32 Bits  | Value stored in the first selected register                                                      |
|  RF_B	         | Output |   32 Bits  | Value stored in the second selected register                                                     |

- **Mux5:** This module has two 5 bit input and is responsible for selecting the second register which output will be visible through RF_B. The output is selected with the dedicated select signal and it has a 10ns delay.
- **Mux32:** This module has two 32 bit input and is responsible for selecting between the result of the ALU and the data read from memory, as the data to be writen in a register. The output is selected with the dedicated select signal and it has a 10ns delay.
- **RF:** This module is the same as the one created in Phase 1.
- **Immed16to32:** This module is responsible for extending the Immed value from 16 to 32 bits. The operation is selected by dedicated 2 bit select signal. The available operations are as follows:
  - "00" : zerofill on the upper 16 bits
  - "01" : sign extend 
  - "10" : zerofill on the lower 16 bits
  - "11" : sign extend and 2 left shifts




## Phase 3
## Phase 4
## Phase 5
