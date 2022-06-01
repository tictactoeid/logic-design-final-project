`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:02:21 05/25/2022
// Design Name:   Control
// Module Name:   D:/Xilinx/Final/Control_test.v
// Project Name:  Final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_test;

	// Inputs
	reg [7:0] Instruction;

	// Outputs
	wire RegDst;
	wire RegWrite;
	wire ALUsrc;
	wire Branch;
	wire MemRead;
	wire MemWrite;
	wire MemtoReg;
	wire ALUOp;

	// Instantiate the Unit Under Test (UUT)
	Control uut (
		.Instruction(Instruction[7:6]), 
		.RegDst(RegDst), 
		.RegWrite(RegWrite), 
		.ALUsrc(ALUsrc), 
		.Branch(Branch), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.MemtoReg(MemtoReg), 
		.ALUOp(ALUOp)
	);
	integer i=0;
	initial begin
		// Initialize Inputs
		Instruction = 8'b00000000;		
		for (i=0; i<512; i=i+1) begin
			Instruction <= Instruction+1;
			#100;
		end		
        
		// Add stimulus here

	end
      
endmodule

