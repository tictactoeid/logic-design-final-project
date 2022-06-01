`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:40:13 05/05/2022 
// Design Name: 
// Module Name:    BCD_to7_2 
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
module BCD_to7_2(
	 input [3:0] In,
	 output reg [6:0] out1
    );
	 
	 always@(In) begin
		case(In)
			4'd0: out1 <= 7'b1111110;
			4'd1: out1 <= 7'b0110000;
			4'd2: out1 <= 7'b1101101;
			4'd3: out1 <= 7'b1111001;
			4'd4: out1 <= 7'b0110011;
			4'd5: out1 <= 7'b1011011;
			4'd6: out1 <= 7'b1011111;
			4'd7: out1 <= 7'b1110000;
			4'd8: out1 <= 7'b1111111;
			4'd9: out1 <= 7'b1111011;
		endcase
	end
endmodule
