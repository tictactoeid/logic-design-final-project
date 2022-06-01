`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:52 05/25/2022 
// Design Name: 
// Module Name:    Registers 
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
module Registers(
    input clk,
    input [1:0] Read_Register1,
    input [1:0] Read_Register2,
    input [1:0] Write_Register,
	 input RegWrite,
	 input reset,
    output [7:0] Read_Data1,
    output [7:0] Read_Data2,
    input [7:0] Write_Data_in,
	 output [7:0] Write_Data_out, // to 7-segment display
	 output [7:0] reg1, //test
	 output [7:0] reg2,
	 output [7:0] reg3,
	 output [7:0] reg4
    );
	 
	 reg [7:0] r1 = 8'b00000000,
					r2 = 8'b00000000,
					r3 = 8'b00000000,
					r4 = 8'b00000000; // 4 registers

	 reg [7:0] rd1 = 8'b00000000, // Read_Data1
					rd2 = 8'b00000000, // Read_Data2
					wdo = 8'b00000000; // Write_Data => 7-seg
	 
	 assign reg1 = r1;
	 assign reg2 = r2;
	 assign reg3 = r3;
	 assign reg4 = r4;
	 
	 //always @(Read_Register1 or Read_Register2 or Write_Register or RegWrite or reset) // posedge clk
	 always @(posedge clk or posedge reset)
		begin
			if (reset) begin
				r1 = 8'b00000000;
				r2 = 8'b00000000;
				r3 = 8'b00000000;
				r4 = 8'b00000000;
				rd1 = 8'b00000000;
				rd2 = 8'b00000000;
				wdo = 8'b00000000;
			end
			else begin
			//wdo = Write_Data_in;
				if(RegWrite) begin
						//wdo = Write_Data_in;	
						case(Write_Register)
							2'b00 : r1 = Write_Data_in;
							2'b01 : r2 = Write_Data_in;
							2'b10 : r3 = Write_Data_in;
							2'b11 : r4 = Write_Data_in;
						endcase
				end
				/*case(Read_Register1)
					2'b00 : rd1 = r1;
					2'b01 : rd1 = r2;
					2'b10 : rd1 = r3;
					2'b11 : rd1 = r4;
				endcase
				case(Read_Register2)
					2'b00 : rd2 = r1;
					2'b01 : rd2 = r2;
					2'b10 : rd2 = r3;
					2'b11 : rd2 = r4;
				endcase*/		
			end
		end
		// assign Read_Data1 = rd1;
		// assign Read_Data2 = rd2;
		assign Read_Data1 = (Read_Register1 == 2'b00) ? r1 : 
								  (Read_Register1 == 2'b01) ? r2 :
								  (Read_Register1 == 2'b10) ? r3 :
								  r4;
		assign Read_Data2 = (Read_Register2 == 2'b00) ? r1 : 
								  (Read_Register2 == 2'b01) ? r2 :
								  (Read_Register2 == 2'b10) ? r3 :
								  r4;
		assign Write_Data_out = Write_Data_in; // wdo;
		
endmodule
