// -----------------------------------
// -- Pedro Henrique Lima Pinheiro ---
// -- 451605 -------------------------
// -- RAM 1x4 ------------------------
// -----------------------------------

`include "FFs.v"

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

module principal;
	reg [3:0] entrada; 
	reg a, rw, clear;	
	wire [3:0] s;
	wire clk;
	
	clock clk1(clk);
	
	ram1x4 r1(s,entrada,a,rw,clk,clear);

	initial begin
		rw = 0;
		a  = 0;
		entrada = 4'b1111;
		#1 rw = 1;		
		#1 a  = 1;
		#5
		$display("addr\tR/W\ts");
		$display("%b\t%b\t%4b",a,rw,s);		
		$finish;
	end 
endmodule // principal