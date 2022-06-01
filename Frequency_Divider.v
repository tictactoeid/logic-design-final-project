`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:15:37 05/02/2022 
// Design Name: 
// Module Name:    Frequency_Divider 
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
module Frequency_Divider(
    input clkin,
    input clr,
    output reg clkout
    );
	 
	 reg [31:0] cnt;
	 	 
	 initial begin
		cnt <= 32'd0;
		clkout <= 1'b0;
	 end
	 
	 always@ (posedge clkin) begin
		if(clr) begin
			cnt <= 32'd0;
			clkout <= 1'b0;
	
		end
		else if(cnt == 32'd25000000) begin //32'd25000000
			cnt <= 32'd0;
			clkout <= ~clkout;
		end
		else begin
			cnt <= cnt + 1'b1;
		end
	end
endmodule
