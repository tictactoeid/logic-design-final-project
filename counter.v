`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:18 05/02/2022 
// Design Name: 
// Module Name:    counter 
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
module counter(
    input clk,
    input reset,
	 input [7:0] value,
	 output [7:0] read_address
    );
	 
	 reg [7:0] address = 8'd0;
	 
	 assign read_address = address;
	 
	 always@(posedge clk or posedge reset)
		begin
			if (reset == 1'b1)
				begin
					address <= 0;
				end
			else
				begin
					address <= value;
				end
		end
endmodule
