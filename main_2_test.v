`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:41:52 05/30/2022
// Design Name:   main_2
// Module Name:   D:/Xilinx/Final/main_2_test.v
// Project Name:  Final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main_2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module main_2_test;

	// Inputs
	reg clock;
	reg reset;

	// Outputs
	wire reg_out_test;
	wire [7:0] PC_out_test;

	// Instantiate the Unit Under Test (UUT)
	main_2 uut (
		.clock(clock), 
		.reset(reset), 
		.reg_out_test(reg_out_test),
		.PC_out_test(PC_out_test)
	);
	always #10 clock = ~clock;
	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 1;
		#10;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule
