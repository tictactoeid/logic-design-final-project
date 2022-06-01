`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:56:50 05/30/2022
// Design Name:   main
// Module Name:   D:/Xilinx/Final/main_test.v
// Project Name:  Final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module main_test;

	// Inputs
	reg clock;
	reg reset;

	// Outputs
	wire [7:0] reg_out_test;
	wire [7:0] PC_out_test;
	wire [7:0] Instruction;
	wire [7:0] read_reg1;
	wire [7:0] read_reg2;
	wire [7:0] read_address;
	wire [7:0] data_memory_out;
	wire [1:0] write_register;
	wire [7:0] reg1;
	wire [7:0] reg2;
	wire [7:0] reg3;
	wire [7:0] reg4;
	wire [7:0] write_reg_data;
	wire [7:0] DataMemory0;
	wire [7:0] DataMemory1;
	wire [7:0] DataMemory2;
	wire [7:0] DataMemory3;
	wire [7:0] DataMemoryAddress;
	
	

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clock(clock), 
		.reset(reset), 
		.reg_out_test(reg_out_test),
		.PC_out_test(PC_out_test),
		.Instruction(Instruction),
		.read_reg1(read_reg1),
		.read_reg2(read_reg2),
		.read_address(read_address),
		.data_memory_out(data_memory_out),
		.write_register(write_register),
		.reg1(reg1),
		.reg2(reg2),
		.reg3(reg3),
		.reg4(reg4),
		.write_reg_data(write_reg_data),
		.DataMemory0(DataMemory0),
		.DataMemory1(DataMemory1),
		.DataMemory2(DataMemory2),
		.DataMemory3(DataMemory3),
		.DataMemoryAddress(DataMemoryAddress)
	);
	always #10 clock = ~clock;
	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;

		
		// Add stimulus here

	end
      
endmodule

