`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:26:20 05/25/2022 
// Design Name: 
// Module Name:    MUX_8bit 
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
module MUX_8bit(
    input [7:0] In1,
    input [7:0] In2,
    input signal,
    output [7:0] out1
    );
	 
	 reg[7:0] out_reg;
	 
	 assign out1 = out_reg;
	 
	 always@(In1 or In2 or signal)
		begin
			if(signal == 0) begin
				out_reg = In1;
			end else begin
				out_reg = In2;
			end
		end
		
endmodule
