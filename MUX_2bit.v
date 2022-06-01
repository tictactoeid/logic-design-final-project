`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:16 05/25/2022 
// Design Name: 
// Module Name:    MUX_2bit 
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
module MUX_2bit(
    input [1:0] In1,
    input [1:0] In2,
    input signal,
    output [1:0] out1
    );
	
	 assign out1 = (signal == 1'b0) ? In1 :
						In2;		


endmodule
