`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:48:05 05/30/2022
// Design Name:   main
// Module Name:   D:/Xilinx/Final/test.v
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

module test;

	// Inputs
	reg clock;
	reg [7:0] Instruction;
	reg reset;

	// Outputs
	wire reg_out_test;
	wire [7:0] read_address;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clock(clock), 
		.Instruction(Instruction), 
		.reset(reset), 
		.reg_out_test(reg_out_test), 
		.read_address(read_address)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		Instruction = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

