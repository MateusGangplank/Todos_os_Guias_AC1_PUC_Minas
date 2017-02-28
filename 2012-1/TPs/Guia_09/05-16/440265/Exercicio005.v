// ----------------------------------
// -- Alexandre Palmieri Sad
// -- 440265
// ----------------------------------

`include "flipflopT.V"

module CDOT (s, CLK, CLR);
	output [3:0]s;
	input  CLK;
	input  CLR;
	
	wire	[3:0]q;
	wire	[3:0]qnot;
	wire	w1, w2;
	
	and F(w1,q[3],qnot[2],qnot[1],qnot[0]);
	or  E(w2, w1, CLR);
	
	tff D(q[0],qnot[0],CLK,CLK,0,w2);
	tff C(q[1],qnot[1],qnot[0],qnot[0],0,w2);
	tff B(q[2],qnot[2],qnot[1],qnot[1],0,w2);
	tff A(q[3],qnot[3],qnot[2],qnot[2],0,w2);
	
	assign s = q;
endmodule

module principal;
	reg     clr;
	wire    clk;
	wire [3:0]s;
	
	clock ck(clk);
	
	CDOT contador(s, clk, clr);
	
	initial begin
		clr = 0;
		$monitor("%4b --> %d", s, s);
		#1 clr = 1;
		#1 clr = 0;
		#630
		$finish;
	end
endmodule