`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:12 05/25/2022 
// Design Name: 
// Module Name:    Control 
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
module Control(
    input [7:6] Instruction,
    output reg RegDst,
    output reg RegWrite,
    output reg ALUsrc,
    output reg Branch,
    output reg MemRead,
    output reg MemWrite,
    output reg MemtoReg,
    output reg ALUOp // R lw sw J -> 1 0 0 0 in pdf / 1 1 1 0?
    );
	 
	 reg [7:0] out;
	 	 
	 always @(Instruction)
	 begin
		case(Instruction)
			2'b00 : out = 8'b11000001;// R
			2'b01 : out = 8'b01101011;// lw // b01101010
			2'b10 : out = 8'b00100101;// sw // b00100100
			2'b11 : out = 8'b00010000;// J
			default : out = 8'b00000000;
		endcase
		RegDst = out[7];
		RegWrite = out[6];
		ALUsrc = out[5];
		Branch = out[4];
		MemRead = out[3];
		MemWrite = out[2];
		MemtoReg = out[1];
		ALUOp = out[0];
	end		
		
endmodule
