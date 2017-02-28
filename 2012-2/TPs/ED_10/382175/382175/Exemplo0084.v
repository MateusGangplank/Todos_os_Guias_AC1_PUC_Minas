//-------------------------------------
// Exemplo0084
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

module ram4x8 (output [7:0] s, input [7:0] entrada, input [1:0] a, input rw, input clk, input clear);
	wire [3:0]aux;
	wire [7:0]x; 
	wire [7:0]y; 
	wire [7:0]z; 
	wire [7:0]w;
	
	dmx2bits dmx(aux, 1, a);
	ram1x8 ram1 (x, entrada, aux[0], rw, clk, clear);
	ram1x8 ram2 (y, entrada, aux[1], rw, clk, clear);
	ram1x8 ram3 (z, entrada, aux[2], rw, clk, clear);
	ram1x8 ram4 (w, entrada, aux[3], rw, clk, clear);
	mux2bits mux(s, x, y, z, w, a);

endmodule // ram4x8

module principal;
	reg [7:0] entrada; 
	reg [1:0] a;
	reg rw, clear;	
	wire [7:0] s;
	wire clk;
	
	clock clk1(clk);
	
	ram4x8 r1(s,entrada,a,rw,clk,clear);

	initial begin
		rw = 0;
		a  = 2'b00;
		clear = 0;
		entrada = 8'b00000001;
		$display("addr\ts");
		$monitor("%b\t%4b",a,s);
		#1 clear = 1;
		#1 clear = 0;
		#1 rw = 1;
		#5 entrada = 8'b00000100; a = 2'b01;
		#10 entrada = 8'b00010000; a = 2'b10;
		#10 entrada = 8'b01000000; a = 2'b11;
		#20 $finish;
	end 
endmodule // principal

/*
    addr	s
    00	xxxxxxxx
    00	00000000
    00	00000001
    01	00000100
    10	00010000
    11	01000000
*/