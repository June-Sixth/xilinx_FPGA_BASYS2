`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:15:17 12/11/2018 
// Design Name: 
// Module Name:    c6 
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
module c6(
    input clk,
    input cr,
    output rco,
    input en,
    output [3:0] bcd6
    );
	reg [3:0] bcd6r;
	assign rco=(bcd6r==5)?1'b1:1'b0;//½øÎ»ÐÅºÅ
	assign bcd6=bcd6r;
	always @(posedge clk or negedge cr)
		if(!cr)
			bcd6r <=4'b0000;
		else if(en)
			if(bcd6r!=5)
				bcd6r<=bcd6r+1'b1;
			else
				bcd6r<=0;
		else
			bcd6r<=bcd6r;
endmodule
