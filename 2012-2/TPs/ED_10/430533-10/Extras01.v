//-------------------------------------
// Nome: Roger Rubens Machado
// Matricula: 430533
//-------------------------------------
`include "clock.v"
`include "ram1x4.v"


module ram1x16(output [15:0]s, input [15:0]x,
                input addr,input rw, input clk, input clear);
	ram1x4 ram0(s[3:0],x[3:0],addr,rw,clk,clear);
	ram1x4 ram1(s[7:4],x[7:4],addr,rw,clk,clear);
	ram1x4 ram2(s[11:8],x[11:8],addr,rw,clk,clear);
	ram1x4 ram3(s[15:12],x[15:12],addr,rw,clk,clear);
endmodule //ram1x16

module principal07;
	reg [15:0]in0;
	wire [15:0]out0;
	reg rw, addr, clear;
	wire clk;
	
	clock clock(clk);
	
	ram1x16 ram1(out0,in0,addr,rw,clk,clear);

initial begin
		clear = 0;
		rw = 0;
		addr = 0;
		in0 = 16'b1101101011001111;
		$display("Extras01-RAM 1X16- Roger Rubens Machado - 430533");
		$display("addr \t rw \t clk   \t in0    \t out0");
		$monitor("%b \t %b \t %b \t %16b \t %16b",addr,rw,clk,in0,out0);
		#1 clear = 1;
		#1 clear = 0;
		#1 rw = 1; addr = 1;
		#3 rw = 0; in0 = 16'b0000111100001111;
		#1addr = 0;
		#1addr = 1;
		#1 rw = 1;
		#1 rw = 0; in0 = 16'b1111111111111111;
		#1 addr = 0;
		#1 addr = 1;
		#1 addr = 0;
		#1 addr = 1;
		#1 rw = 1;
		#1 rw = 0; in0 = 0;
		#1 addr = 0;
		#1 addr = 1;
		#1 $finish;
	end
endmodule //principal