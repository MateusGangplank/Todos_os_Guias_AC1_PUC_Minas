//-------------------------------------
// Exemplo0083
// Nome: Oswaldo Oliveira Paulino 
// Matricula: 382175
// ------------------------- 

`include "FFs.v"
`include "plexers.v"

module ram1x4 (output [3:0] s, input [3:0] entrada, input a, input rw, input clk, input clear);
	wire x;
	wire y[3:0];
	wire z[3:0];
	
	and AND1(x, a, rw, clk);
	
	jkff flip1(y[0], z[0], entrada[0], ~entrada[0], x, 0, clear);
	jkff flip2(y[1], z[1], entrada[1], ~entrada[1], x, 0, clear);
	jkff flip3(y[2], z[2], entrada[2], ~entrada[2], x, 0, clear);
	jkff flip4(y[3], z[3], entrada[3], ~entrada[3], x, 0, clear);
	
	and AND2(s[0], y[0], a);
	and AND3(s[1], y[1], a);
	and AND4(s[2], y[2], a);
	and AND5(s[3], y[3], a);
endmodule // ram1x4

module ram1x8 (output [7:0] s, input [7:0] entrada, input a, input rw, input clk, input clear);

	ram1x4  ram1(s[3:0], entrada[3:0], a, rw, clk, clear);
	ram1x4  ram2(s[7:4], entrada[7:4], a, rw, clk, clear);
	
endmodule // ram1x8

module principal;
	reg [7:0] entrada; 
	reg a, rw, clear;	
	wire [7:0] s;
	wire clk;
	
	clock clk1(clk);
	
	ram1x8 r1(s,entrada,a,rw,clk,clear);

	initial begin
		rw = 0;
		a  = 0;
		clear = 0;
		entrada = 8'b11111111;
		$display("addr\ts");
		$monitor("%b\t%4b",a,s);
		#1 clear = 1;
		#1 clear = 0;
		#5 rw = 1; a = 1;	
		#5 $finish;
	end 
endmodule // principal

/*
    addr	s
    0		00000000
    1		11111111
*/