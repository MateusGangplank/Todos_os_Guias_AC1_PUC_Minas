// -------------------------------------------------
// -- Alexandre Palmieri Sad
// -- 440265
// -- Exercicio003
// -------------------------------------------------
`include "clock.v"
`include "FFD.v"


//--------------------------------------------------
// -- MODULE TESTE
//--------------------------------------------------
module RDE4B(qa, qb, qc, qd, d, clk, preset, clear);
	output qa;
	output qb;
	output qc;
	output qd;
	input  d;
	input  clk;
	input  preset;
	input  clear;
	
	wire qa, qb, qc, qd; 
	wire qnota, qnotb, qnotc, qnotd;
	wire x0;
	
	or  O(x0, d, qd);
	dff A(qa, qnota, x0, clk, 1, clear);
	dff B(qb, qnotb, qa, clk, preset, clear);
	dff C(qc, qnotc, qb, clk, preset, clear);
	dff D(qd, qnotd, qc, clk, preset, clear);
	
	always @(posedge clk)
		begin
		$display("%d -> %b%b%b%b",$time, qa, qb, qc, qd);
		end
endmodule

//--------------------------------------------------
// -- MODULE TESTE
//--------------------------------------------------
module teste;
	wire clk;
	reg d;
	reg preset;
	reg clear;
	wire qa, qb, qc, qd;
	
	clock ck( clk );
	RDE4B rde(qa, qb, qc, qd, d, clk, preset, clear);
	
	initial begin:start
		preset = 0;
		clear = 0;
		d = 0;
	end
	
	initial begin
		$display("---------------------------");
		$display("Alexandre Palmieri Sad");
		$display("440265");
		$display("---------------------------");
		#12 d = 0;
		#10 d = 1;
		#20 d = 0;
		#20 d = 0;
		#20 $finish;
		
	end
	
endmodule