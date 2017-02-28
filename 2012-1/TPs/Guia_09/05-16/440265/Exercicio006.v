// ----------------------------------
// -- Alexandre Palmieri Sad
// -- 440265
// ----------------------------------

`include "flipflopJK.v"

module C5Bits (s, pulse, CLK, CLR);
	output [4:0]s;
	input  pulse;
	input  CLK;
	input  CLR;
	
	wire	[4:0]q;
	wire	[4:0]qnot;
	wire	n, f;
	
	or  F(f, pulse, q[4]);
	not N(n, f);
	
	jkff A(q[0],qnot[0],f,n,CLK,0,CLR);
	jkff B(q[1],qnot[1],q[0],qnot[0],CLK,0,CLR);
	jkff C(q[2],qnot[2],q[1],qnot[1],CLK,0,CLR);
	jkff D(q[3],qnot[3],q[2],qnot[2],CLK,0,CLR);
	jkff E(q[4],qnot[4],q[3],qnot[3],CLK,0,CLR);
	
	assign s = q;
endmodule

module principal;
	reg     clr;
	reg 	  pulse;
	wire    clk;
	wire [4:0]s;
	
	clock ck(clk);
	
	C5Bits contador(s, pulse, clk, clr);
	
	initial begin
		pulse = 1;
		clr = 0;
		$monitor("%4b --> %d", s, s);
		#1 clr = 1;
		#1 clr = 0;
		#10 pulse = 0;
		
		#630
		$finish;
	end
endmodule