`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:29:09 05/30/2022
// Design Name:   Registers
// Module Name:   D:/Xilinx/Final/Registers_test.v
// Project Name:  Final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Registers
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Registers_test;

	// Inputs
	//reg clk;
	reg [1:0] Read_Register1;
	reg [1:0] Read_Register2;
	reg [1:0] Write_Register;
	reg RegWrite;
	reg reset;
	reg [7:0] Write_Data_in;

	// Outputs
	wire [7:0] Read_Data1;
	wire [7:0] Read_Data2;
	wire [7:0] Write_Data_out;

	// Instantiate the Unit Under Test (UUT)
	Registers uut (
		//.clk(clk), 
		.Read_Register1(Read_Register1), 
		.Read_Register2(Read_Register2), 
		.Write_Register(Write_Register), 
		.RegWrite(RegWrite), 
		.reset(reset), 
		.Read_Data1(Read_Data1), 
		.Read_Data2(Read_Data2), 
		.Write_Data_in(Write_Data_in), 
		.Write_Data_out(Write_Data_out)
	);
	
	//always #10 clk = ~clk;
	initial begin
		// Initialize Inputs
		//clk = 0;
		Read_Register1 = 0;
		Read_Register2 = 0;
		Write_Register = 0;
		RegWrite = 0;
		reset = 0;
		Write_Data_in = 0;
		
		// Wait 100 ns for global reset to finish
		#40;
		
		RegWrite = 1;
		Write_Register = 2'b00;
		Write_Data_in = 4;
		#10;
		
		RegWrite = 0;
		#10;
		
		RegWrite = 1;
		Write_Register = 2'b01;
		Write_Data_in = 5;
		#10;
		RegWrite = 0;
		#10;
		
		RegWrite = 1;
		Write_Register = 2'b10;
		Write_Data_in = 6;
		#10;
		RegWrite = 0;
		#10;
		
		RegWrite = 1;
		Write_Register = 2'b11;
		Write_Data_in = 7;
		#10;
		RegWrite = 0;
		#10;
		
		Read_Register1 = 2'b00;
		Read_Register2 = 2'b01;
		#10;
		
		Read_Register1 = 2'b10;
		Read_Register2 = 2'b11;
		#10;
		
		#100;
		reset = 1;
		#7;
		reset = 0;
		Read_Register1 = 2'b00;
		Read_Register2 = 2'b01;
		#10;
		Read_Register1 = 2'b10;
		Read_Register2 = 2'b11;
      
		// Add stimulus here

	end
      
endmodule

