`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:06:08 12/11/2018 
// Design Name: 
// Module Name:    clock_alarm 
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
module clock_alarm(
    input clk_1hz,
    input clk_1k,
    input clk_5h,
    input en_set,
    input cr,
    input min_hour,
    input [3:0] bcd_tmu,
    input [3:0] bcd_tmt,
    input [3:0] bcd_thu,
    input [3:0] bcd_tht,
    output [3:0] bcd_smu,
    output [3:0] bcd_smt,
    output [3:0] bcd_shu,
    output [3:0] bcd_sht,
    output alarm
    );
	wire equ;
	assign equ = (bcd_tmu==bcd_smu)&(bcd_tmt==bcd_smt)&(bcd_thu==bcd_shu)&(bcd_tht==bcd_sht);
	assign alarm = (equ&clk_1k&clk_1hz)|(equ&clk_5h&~clk_1hz);
	set_time u_set_time(clk_1hz,en_set,min_hour,bcd_smu,bcd_smt,bcd_shu,bcd_sht,cr);
	
endmodule
