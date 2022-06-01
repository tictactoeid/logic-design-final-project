`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:43 05/25/2022 
// Design Name: 
// Module Name:    BCD_to7_hexadecimal 
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
module BCD_to7_hexadecimal(
    input [3:0] in,
    output reg [6:0] out
    );
	 
	 always@(in) begin
		case(in)
			4'd0: out <= 7'b1111110;
			4'd1: out <= 7'b0110000;
			4'd2: out <= 7'b1101101;
			4'd3: out <= 7'b1111001;
			4'd4: out <= 7'b0110011;
			4'd5: out <= 7'b1011011;
			4'd6: out <= 7'b1011111;
			4'd7: out <= 7'b1110000;
			4'd8: out <= 7'b1111111;
			4'd9: out <= 7'b1111011;
			4'd10: out <= 7'b1110111; // a
			4'd11: out <= 7'b0011111; // b
			4'd12: out <= 7'b1001110;// c
			4'd13: out <= 7'b0111101; // d
			4'd14: out <= 7'b1001111;// e
			4'd15: out <= 7'b1000111;// f
		endcase
	end


endmodule
