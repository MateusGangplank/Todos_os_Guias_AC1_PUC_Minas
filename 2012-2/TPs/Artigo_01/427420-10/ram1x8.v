`include "ram1x4.v"

module ram1x8(output [7:0]s,input[7:0]x,input clk,
			input readWrite,input address,input clear);
	ram1x4 ram1(s[3:0],x[3:0],clk,readWrite,address,clear);
	ram1x4 ram2(s[7:4],x[7:4],clk,readWrite,address,clear);
endmodule //ram1x8