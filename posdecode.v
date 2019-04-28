`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:57:11 12/12/2018 
// Design Name: 
// Module Name:    posdecode 
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
module posdecode(
    input [3:0] bcd6,
    output [3:0] pos
    );
	 reg [3:0] posr;
	 assign pos = posr;
	 always @(bcd6)
	 case (bcd6)
/*	 4'b0000:posr <= 8'b11011111;
	 4'b0001:posr <= 8'b11101111;
	 4'b0010:posr <= 8'b11110111;
	 4'b0011:posr <= 8'b11111011;
	 4'b0100:posr <= 8'b11111101;
	 4'b0101:posr <= 8'b11111110;
	 default:posr <= 8'b11111111;
*/
	 4'b0000:posr <= 4'b1110;
	 4'b0001:posr <= 4'b1101;
	 4'b0010:posr <= 4'b1011;
	 4'b0011:posr <= 4'b0111;
	 default:posr <= 4'b1111;
	 endcase

endmodule
