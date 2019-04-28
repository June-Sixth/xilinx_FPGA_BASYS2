`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:15:17 12/11/2018 
// Design Name: 
// Module Name:    c60 
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
module c60(
    input clk,
	 input en,
    input cr,
    output rco,
    output [3:0] bcd_t,
	 output [3:0] bcd_u
    );
	wire rco_u,rco_t;
	assign rco=rco_u&rco_t;//60½øÎ»ÐÅºÅ
	c10 units(clk,en,cr,rco_u,bcd_u);
	c6 tens(clk,cr,rco_t,rco_u&en,bcd_t);
endmodule