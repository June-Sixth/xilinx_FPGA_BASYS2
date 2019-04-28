`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:03:40 12/12/2018 
// Design Name: 
// Module Name:    radio 
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
module radio(
    input [3:0] bcd_su,
    input [3:0] bcd_st,
    input [3:0] bcd_mu,
    input [3:0] bcd_mt,
    input [3:0] bcd_hu,
    input [3:0] bcd_ht,
    input clk_1k,
    input clk_5h,
    input clk_1hz,
    input en,
    input cr,
    input day_night,
    output radio_alarm
    );
	 wire ld,min_equ;
	 wire equ,grt,less,noon;
	 wire [3:0] bcd_temp_hu,bcd_temp_ht;
	 assign noon=({bcd_ht,bcd_hu}==5'h12);//中午12点标志
	 assign {bcd_temp_ht,bcd_temp_hu}=(noon&day_night)?8'h00:{bcd_ht,bcd_hu};//中午12点且如果12小时制则是下午0点
	 assign min_equ=((bcd_mt==5)&&(bcd_mu==9))?1'b1:1'b0;//整点来临前
	 assign equ=({bcd_st,bcd_su,bcd_mt,bcd_mu}==16'h0000)?1'b1:1'b0;//整点
	 assign grt=(({bcd_st,bcd_su}+{bcd_temp_ht,bcd_temp_hu}+8'h1)>8'h5a)?1'b1:1'b0;
	 assign radio_alarm=(((grt&min_equ&clk_5h)|(equ&clk_1k))&clk_1hz)&en;//整点来临前输出500hz信号，整点时输出1khz信号
	 
endmodule
