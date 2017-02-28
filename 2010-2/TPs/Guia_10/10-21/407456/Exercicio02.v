//`include "clock.v"; 

module latchSR (q, q1, s, r, clk, pr, cl);

	input s, r, clk, pr, cl;
	output q, q1;
	wire w0, w1;
	
	//assign q1 = ~q;
	
	nand (w0, s, clk);
	nand (w1, r, clk);
	nand (q, pr, q1, w0);
	nand (q1, cl, q, w1);
	
endmodule// latch SR

module Exercicio02;

	reg a, b, pr, cl, clk;
	wire q, q1;
	
	latchSR L1 (q, q1, a, b, clk, pr, cl);
	
	initial
	begin
		
		$display ("Exercicio 2");
		$display ("Teste de Latch SR");
		$display ("");
		$display ("S R Q ~Q  Pr  Cl  Clk");
		a=0; b=0; pr = 0; cl = 0; clk = 0;
		$monitor ("%b %b %b %b  %b  %b  %b", a, b, q, q1, pr, cl, clk);
		#1 a=0; b=1; pr = 0; cl = 0;
		#1 a=1; b=0; pr = 0; cl = 0;
		#1 a=1; b=1; pr = 0; cl = 0;
		#1 a=0; b=0; pr = 1; cl = 0;
		#1 a=0; b=1; pr = 1; cl = 0;
		#1 a=1; b=0; pr = 1; cl = 0;
		#1 a=1; b=1; pr = 1; cl = 0;
		#1 a=0; b=0; pr = 0; cl = 1;
		#1 a=0; b=1; pr = 0; cl = 1;
		#1 a=1; b=0; pr = 0; cl = 1;
		#1 a=1; b=1; pr = 0; cl = 1;
		#1 a=0; b=0; pr = 1; cl = 1;
		#1 a=0; b=1; pr = 1; cl = 1;
		#1 a=1; b=0; pr = 1; cl = 1;
		#1 a=1; b=1; pr = 1; cl = 1;
		
		#1 a=0; b=0; pr = 0; cl = 0; clk = 1;
		#1 a=0; b=1; pr = 0; cl = 0;
		#1 a=1; b=0; pr = 0; cl = 0;
		#1 a=1; b=1; pr = 0; cl = 0;
		#1 a=0; b=0; pr = 1; cl = 0;
		#1 a=0; b=1; pr = 1; cl = 0;
		#1 a=1; b=0; pr = 1; cl = 0;
		#1 a=1; b=1; pr = 1; cl = 0;
		#1 a=0; b=0; pr = 0; cl = 1;
		#1 a=0; b=1; pr = 0; cl = 1;
		#1 a=1; b=0; pr = 0; cl = 1;
		#1 a=1; b=1; pr = 0; cl = 1;
		#1 a=0; b=0; pr = 1; cl = 1;
		#1 a=0; b=1; pr = 1; cl = 1;
		#1 a=1; b=0; pr = 1; cl = 1;
		#1 a=1; b=1; pr = 1; cl = 1;

		
	end
endmodule// test