`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:31:50 05/25/2022
// Design Name:   MUX_2bit
// Module Name:   D:/Xilinx/Final/MUX_2bit_test.v
// Project Name:  Final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX_2bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MUX_2bit_test;

	// Inputs
	reg [1:0] In1;
	reg [1:0] In2;
	reg signal;

	// Outputs
	wire [1:0] out1;

	// Instantiate the Unit Under Test (UUT)
	MUX_2bit uut (
		.In1(In1), 
		.In2(In2), 
		.signal(signal), 
		.out1(out1)
	);
	integer i=0;
	initial begin
		// Initialize Inputs
		In1 = 0;
		In2 = 0;
		signal = 0;
		
		for (i=0; i<64 ; i=i+1) begin
			signal = i[4];
			In2 = i[1:0];
			In1 = i[3:2];
			#100;
		end

	end
      
endmodule

