`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:52:13 12/12/2018 
// Design Name: 
// Module Name:    set_time 
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
module set_time(
    input clk,
    input en,
    input min_hour,
    output [3:0] bcd_mu,
    output [3:0] bcd_mt,
    output [3:0] bcd_hu,
    output [3:0] bcd_ht,
    input cr
    );
	 wire en_min,en_hour,rco_60;
	 assign en_min=en&min_hour;
	 assign en_hour=en&~min_hour;
	 c24 hour(clk,en_hour,cr,bcd_hu,bcd_ht);
	 c60 minute(clk,en_min,cr,rco60,bcd_mt,bcd_mu);
endmodule
