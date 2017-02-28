// -------------------------------------------------
// -- Alexandre Palmieri Sad
// -- 440265
// -- Exercicio007
// -------------------------------------------------
`include "clock.v"
`include "FFD.v"


//--------------------------------------------------
// -- MODULE TESTE
//--------------------------------------------------
module RDE4B(s, d, clk, preset, clear);
	output [3:0]s;
	input  d;
	input  clk;
	input  preset;
	input  clear;
	
	wire qa, qb, qc, qd; 
	wire qnota, qnotb, qnotc, qnotd;
	wire x0;
	
	or  O(x0, d, qnotd);
	dff A(s[3], qnota,   x0, clk, preset, clear);
	dff B(s[2], qnotb, s[3], clk, preset, clear);
	dff C(s[1], qnotc, s[2], clk, preset, clear);
	dff D(s[0], qnotd, s[1], clk, preset, clear);
	
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
	reg d;
	reg preset;
	reg clear;
	wire [3:0]s;
	
	clock ck( clk );
	RDE4B rde(s, d, clk, preset, clear);
	
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
		#1 preset = 1; clear = 0;
		#1 preset = 0; clear = 0;
		#12 d = 0;
		#10 d = 0;
		#20 d = 0;
		#20 d = 0;
		#20 d = 0;
		#20 d = 0;
		#1 preset = 0; clear = 1;
		#1 preset = 0; clear = 0;
		#12 d = 1;
		#10 d = 0;
		#20 d = 0;
		#20 d = 0;
		#20 $finish;
		
	end
	
endmodule