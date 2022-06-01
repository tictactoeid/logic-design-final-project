`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:37:04 05/25/2022 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory(
	 input clk,
    input [7:0] Address,
    input [7:0] WriteData,
    input MemRead,
    input MemWrite,
	 input reset,
    output [7:0] ReadData,
	 output [7:0] DataMemory0, // test
	 output [7:0] DataMemory1,
	 output [7:0] DataMemory2,
	 output [7:0] DataMemory3
    );
	 
	 
	 reg[7:0] Data[31:0];
	 integer i;
	 initial begin
		for(i = 0; i < 16; i = i + 1) begin
			Data[i] = i;
		end
		for(i = 0; i < 16; i = i + 1) begin
			Data[i+16] = -1 * i;
		end
	 end
	 
	 // reg[7:0] readData;
	 
	 assign ReadData = (MemRead == 1'b1) ? Data[Address] : 8'd0;
	 assign DataMemory0 = Data[0]; // test
	 assign DataMemory1 = Data[1]; 
	 assign DataMemory2 = Data[2]; 
	 assign DataMemory3 = Data[3]; 
	 
	 
	 //always@ (Address or WriteData or MemRead or MemWrite or reset)
	 always@ (posedge clk or posedge reset) // posedge clk or reset
		begin
			if(reset) begin
				for(i = 0; i < 16; i = i + 1) begin
					Data[i] = i; // <=
				end
				for(i = 0; i < 16; i = i + 1) begin
					Data[i+16] = -1 * i;
				end
			end
			else if (MemWrite) begin
				Data[Address] = WriteData;
				
				/*else begin
					if(MemRead) begin
					if(Address < 32) begin
						readData = Data[Address];
					end
				end else if (MemWrite) begin
					if(Address < 32) begin
						Data[Address] = WriteData;
					end
				end*/
			end
		end

endmodule
