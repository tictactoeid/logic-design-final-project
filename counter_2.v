`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:37:57 05/30/2022 
// Design Name: 
// Module Name:    counter_2 
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
module counter_2(
    input clk,
    input reset,
	 input [7:0] jump_value,
	 input Branch,
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
			else if (Branch == 1'b1) begin
					address <= address + jump_value + 1;
			end
			else begin
				address <= address + 1;
			end
		end
endmodule
