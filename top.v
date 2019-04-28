`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:07:56 12/11/2018 
// Design Name: 
// Module Name:    top 
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
module top(
    input clk_100m,
    input cr,
    input en_clock,
    input clock_adjust,
    input clock_alarm_en,
    input clock_alarm_set,
    input min_hour_set,
    input alarm_adjust_disp,
    input day_night,
    output [4:0] pos,
    output [6:0] seg,
    output alarm,
    output day
    );
wire clk_1hz,clk_1k,clk_5h,clock_alarm,radio_alarm,mux_sel,day_radio;
wire [3:0] bcd_day_hu,bcd_day_ht,bcd_day_ht_radio,bcd_day_hu_radio;
wire [3:0] bcd_smu,bcd_smt,bcd_shu,bcd_sht,bcd_mu,bcd_mt,bcd_su,bcd_st;
wire [3:0] bcd_hu,bcd_ht,bcd_temp_mu,bcd_temp_mt,bcd_temp_hu,bcd_temp_ht;
assign alarm=radio_alarm|clock_alarm&clock_alarm_en;
assign mux_sel_set=clock_alarm_set|alarm_adjust_disp;
assign {bcd_temp_mu,bcd_temp_mt,bcd_temp_hu,bcd_temp_ht}=mux_sel_set?{bcd_smu,bcd_smt,bcd_shu,bcd_sht}:{bcd_mu,bcd_mt,bcd_hu,bcd_ht};
clk_div u_clock(clk_100m,clk_1k,clk_5h,clk_1hz,cr);//分频
clock_adjust u_clk_adj(clk_1hz,clock_adjust,cr,min_hour_set,bcd_su,bcd_st,bcd_mu,bcd_mt,bcd_hu,bcd_ht);//计时，校时
clock_alarm u_clk_alarm(clk_1hz,clk_1k,clk_5h,clock_alarm_set,cr,min_hour_set,bcd_mu,bcd_mt,bcd_hu,bcd_ht,bcd_smu,bcd_smt,bcd_shu,bcd_sht,clock_alarm);
day24_12 u_day24_12(bcd_temp_ht,bcd_temp_hu,day_night,day,bcd_day_ht,bcd_day_hu);
day24_12 u_radio_day24_12(bcd_ht,bcd_hu,day_night,day_radio,bcd_day_ht_radio,bcd_day_hu_radio);
radio u_radio(bcd_su,bcd_st,bcd_mu,bcd_mt,bcd_day_hu_radio,bcd_day_ht_radio,clk_1k,clk_5h,clk_1hz,en_clock,cr,day_night,radio_alarm);
scan_disp u_scan_disp(clk_1k,cr,en_clock,bcd_day_ht,bcd_day_hu,bcd_temp_mt,bcd_temp_mu,bcd_st,bcd_su,seg,pos);
endmodule
