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

// counter logic changed (without adder)

module main_2(
	 input clock,
	 // input [7:0] Instruction,
	 input reset,
	 output reg_out_test, // only for test -> use 7-segment instead
	 output [7:0] PC_out_test
	 //output [6:0] ten,
	 //output [6:0] one,
	 // output [7:0] read_address
    );
	 
	 wire [7:0] Instruction; // only for test
	 wire [7:0] read_address; // only for test
	 
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
	 wire [1:0] write_register; // registers input
	 wire [7:0] read_reg_data1; // registers output
	 wire [7:0] read_reg_data2; // registers output
	 wire [7:0] read_reg_data2_toALU; // read_reg_data2 -> MUX -> ALU
	 wire [7:0] write_reg_data; // registers input
	 wire [7:0] reg_out; // registers output to 7-seg
	 wire [7:0] ALU_out;
	 wire [7:0] data_memory_out; // DataMemory out (Read Data)
	 wire [7:0] Add1_out; // Add1 -> Add2, Add1 -> Mux4
	 wire [7:0] Add2_out; // Add2 -> Mux4
	 
	 wire [7:0] sign_extended;
	 assign sign_extended = $signed(Instruction[1:0]);
	 
	 assign reg_out_test = reg_out; // only for test
	 
	 
	
	 //Frequency_Divider T1(.clkin(clock), .clr(reset), .clkout(clkout));
	 assign clkout = clock; // test
	 
	 //counter Counter(.clk(clkout), .reset(reset), .value(PC_in), .read_address(PC_out));
	 counter_2 Counter(.clk(clkout), .reset(reset), .jump_value(sign_extended), .Branch(Branch), .read_address(PC_out));
	 IMEM IMEM(.instruction(Instruction), .Read_Address(read_address));
	 Control Control(.Instruction(Instruction[7:6]), .RegDst(RegDst), .RegWrite(RegWrite), .ALUsrc(ALUsrc), .Branch(Branch), .MemRead(MemRead), .MemWrite(MemWrite), .MemtoReg(MemtoReg), .ALUOp(ALUOp));
	 Registers Registers(.Read_Register1(Instruction[5:4]), .Read_Register2(Instruction[3:2]), .Write_Register(write_register), .RegWrite(RegWrite), .reset(reset), .Read_Data1(read_reg_data1), .Read_Data2(read_reg_data2), .Write_Data_in(write_reg_data), .Write_Data_out(reg_out));
	 
	 MUX_2bit Mux1(.In1(Instruction[3:2]), .In2(Instruction[1:0]), .signal(RegDst), .out1(write_register));
	 
	 MUX_8bit Mux2(.In1(read_reg_data2), .In2(sign_extended), .signal(ALUsrc), .out1(read_reg_data2_toALU));
	 ALU ALU(.A(read_reg_data1), .B(sign_extended), .F(ALU_out), .ALUop(ALUOp));
	 
	 DataMemory DataMemory(.Address(ALU_out), .WriteData(read_reg_data2), .MemRead(MemRead), .MemWrite(MemWrite), .reset(reset), .ReadData(data_memory_out));
	 MUX_8bit Mux3(.In1(ALU_out), .In2(data_memory_out), .signal(MemtoReg), .out1(write_reg_data));
	 
	 ALU Add1(.A(PC_out), .B(8'd1), .F(Add1_out), .ALUop(1'b1));
	 ALU Add2(.A(Add1_out), .B(sign_extended), .F(Add2_out), .ALUop(1'b1));
	 MUX_8bit Mux4(.In1(Add1_out), .In2(Add2_out), .signal(Branch), .out1(PC_in));
	 
	 // 7-seg
endmodule

