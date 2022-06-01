`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:40:09 05/25/2022 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [7:0] A,
    input [7:0] B,
    output [7:0] F,
    input ALUop
    );
	 
	 reg [7:0] out = 7'b0000000;
	 assign F = out;
	 
	 always@ (*)
		begin
			//out = A+B;
			if(ALUop == 1'b1)
				begin
					out = A+B;
				end
		end


endmodule
