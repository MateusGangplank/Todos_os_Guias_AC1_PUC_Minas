// -------------------------------------------------
// -- Alexandre Palmieri Sad
// -- 440265
// -- Exercicio005
// -------------------------------------------------
`include "clock.v"
`include "FFD.v"


//--------------------------------------------------
// -- MODULE TESTE
//--------------------------------------------------
module RDE4B(s, clk, clear, d, l);
	output [3:0]s;
	input  [3:0]d;
	input  clk;
	input  l;
	input  clear;
	
	wire qa, qb, qc, qd; 
	wire qnota, qnotb, qnotc, qnotd;
	wire x0, x1, x2, x3;
	
	and E(x3, l, d[3]);
	and F(x2, l, d[2]);
	and G(x1, l, d[1]);
	and H(x0, l, d[0]);
	dff A(s[3], qnota,    0, clk, x3, clear);
	dff B(s[2], qnotb, s[3], clk, x2, clear);
	dff C(s[1], qnotc, s[2], clk, x1, clear);
	dff D(s[0], qnotd, s[1], clk, x0, clear);
	
	always @(posedge clk)
		begin
		$display("%d -> %b%b%b%b",$time, s[3], s[2], s[1], s[0]);
		end
endmodule

//--------------------------------------------------
// -- MODULE TESTE
//--------------------------------------------------
module teste;
	wire clk;
	reg [3:0]d;
	reg l;
	reg clear;
	wire [3:0]s;
	
	clock ck( clk );
	RDE4B rde(s, clk, clear, d, l);
	
	initial begin:start
		l = 0;
		clear = 0;
		d = 0;
	end
	
	initial begin
		$display("---------------------------");
		$display("Alexandre Palmieri Sad");
		$display("440265");
		$display("---------------------------");
		#1 d = 4'b1111;
		#1 l = 1;
		#1 l = 0; 
		#12 d = 4'b1111;
		#10 d = 4'b1111;
		#20 d = 4'b1111;
		#20 d = 4'b1100; l = 1;
		#1  l = 0;
		#31
		#20 $finish;
		
	end
	
endmodule