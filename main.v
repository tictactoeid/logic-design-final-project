`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:32:42 05/25/2022 
// Design Name: 
// Module Name:    main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module main(
	 input clock,
	 // input [7:0] Instruction,
	 input reset,
	 output [7:0] reg_out_test, // only for test -> use 7-segment instead
	 /*output [7:0] PC_out_test,
	 output [7:0] Instruction, //test // output inst,
	 output [7:0] read_reg1,
	 output [7:0] read_reg2,
	 //output [6:0] ten,
	 //output [6:0] one,
	 output [7:0] read_address,
	 output [7:0] data_memory_out,	 // test
	 output [1:0] write_register, // test
	 output [7:0] reg1,
	 output [7:0] reg2,
	 output [7:0] reg3,
	 output [7:0] reg4,
	 output [7:0] write_reg_data,
	 output [7:0] DataMemory0,
	 output [7:0] DataMemory1,
	 output [7:0] DataMemory2,
	 output [7:0] DataMemory3,
	 output [7:0] DataMemoryAddress*/
	 output [6:0] BCD_output1,
	 output [6:0] BCD_output2,
	 output [6:0] BCD_output3,
	 output [6:0] BCD_output4
    );
		
	 wire [7:0] Instruction; // only for test > comment
	 wire [7:0] read_address; // only for test > comment
	 
	 wire [7:0] PC_out;
	 assign read_address = PC_out;
	 assign PC_out_test = PC_out; // only for test
	 wire clkout; // Frequency_Divider
	 wire [7:0] PC_in; // counter
	 wire RegDst; // control
	 wire RegWrite;
	 wire ALUsrc;
	 wire Branch;
	 wire MemRead;
	 wire MemWrite;
	 wire MemtoReg;
	 wire ALUOp; // control
	 wire [1:0] write_register; // registers input => comment
	 wire [7:0] read_reg_data1; // registers output
	 wire [7:0] read_reg_data2; // registers output
	 wire [7:0] read_reg_data2_toALU; // read_reg_data2 -> MUX -> ALU
	 wire [7:0] write_reg_data; // registers input => comment
	 wire [7:0] reg_out; // registers output to 7-seg
	 wire [7:0] ALU_out;
	 wire [7:0] data_memory_out; // DataMemory out (Read Data) comment
	 wire [7:0] Add1_out; // Add1 -> Add2, Add1 -> Mux4
	 wire [7:0] Add2_out; // Add2 -> Mux4
	 
	 wire [7:0] sign_extended;
	 wire [1:0] instruction_control;
	 wire [1:0] instruction_reg_address1;
	 wire [1:0] instruction_reg_address2;
	 wire [1:0] instruction_1_0;
	 
	 assign sign_extended = $signed(Instruction[1:0]);	 
	 assign instruction_control = Instruction[7:6];	 
	 assign instruction_reg_address1 = Instruction[5:4];
	 assign instruction_reg_address2 = Instruction[3:2];
	 assign instruction_1_0 = Instruction[1:0];
	 
	 /*assign reg_out_test = reg_out; // only for test
	 //assign inst = Instruction;
	 assign read_reg1 = read_reg_data1;
	 assign read_reg2 = read_reg_data2;
	 assign DataMemoryAddress = ALU_out;*/
	 
	 
	 Frequency_Divider T1(.clkin(clock), .clr(reset), .clkout(clkout));
	 //assign clkout = clock; // test
	 
	 counter Counter(.clk(clkout), .reset(reset), .value(PC_in), .read_address(PC_out));
	 IMEM IMEM(.instruction(Instruction), .Read_Address(read_address));
	 Control Control(.Instruction(instruction_control), .RegDst(RegDst), .RegWrite(RegWrite), .ALUsrc(ALUsrc), .Branch(Branch), .MemRead(MemRead), .MemWrite(MemWrite), .MemtoReg(MemtoReg), .ALUOp(ALUOp));
	 Registers Registers(.clk(clkout), .Read_Register1(instruction_reg_address1), .Read_Register2(instruction_reg_address2), .Write_Register(write_register), .RegWrite(RegWrite), .reset(reset), .Read_Data1(read_reg_data1), .Read_Data2(read_reg_data2), .Write_Data_in(write_reg_data), .Write_Data_out(reg_out), .reg1(reg1), .reg2(reg2), .reg3(reg3), .reg4(reg4));
	 
	 MUX_2bit Mux1(.In1(instruction_reg_address2), .In2(instruction_1_0), .signal(RegDst), .out1(write_register));
	 
	 MUX_8bit Mux2(.In1(read_reg_data2), .In2(sign_extended), .signal(ALUsrc), .out1(read_reg_data2_toALU));
	 ALU ALU(.A(read_reg_data1), .B(sign_extended), .F(ALU_out), .ALUop(ALUOp));
	 
	 DataMemory DataMemory(.clk(clkout), .Address(ALU_out), .WriteData(read_reg_data2), .MemRead(MemRead), .MemWrite(MemWrite), .reset(reset), .ReadData(data_memory_out), .DataMemory0(DataMemory0), .DataMemory1(DataMemory1), .DataMemory2(DataMemory2), .DataMemory3(DataMemory3));
	 MUX_8bit Mux3(.In1(ALU_out), .In2(data_memory_out), .signal(MemtoReg), .out1(write_reg_data));
	 
	 ALU Add1(.A(PC_out), .B(8'd1), .F(Add1_out), .ALUop(1'b1));
	 ALU Add2(.A(Add1_out), .B(sign_extended), .F(Add2_out), .ALUop(1'b1));
	 MUX_8bit Mux4(.In1(Add1_out), .In2(Add2_out), .signal(Branch), .out1(PC_in));
	 
	 BCD_to7_hexadecimal BCD_1(.in(reg_out[3:0]), .out(BCD_output1));
	 BCD_to7_hexadecimal BCD_2(.in(reg_out[7:4]), .out(BCD_output2));
	 BCD_to7_hexadecimal BCD_3(.in(PC_out[3:0]), .out(BCD_output3));
	 BCD_to7_hexadecimal BCD_4(.in(PC_out[7:4]), .out(BCD_output4));
	 
	 // 7-seg
endmodule

