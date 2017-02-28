module latchSR (q, q1, s, r);

	input s, r;
	output q, q1;
	
	nor (q1, s, q);
	nor (q, r, q1);
	
endmodule// latch SR

module test;

	reg a, b;
	wire q, q1;
	
	latchSR L1 (q, q1, a, b);
	
	initial
	begin
		
		$display ("Exercicio 1");
		$display ("Teste de Latch SR");
		$display ("");
		$display ("a b q ~q");
		a=0; b=0;
		$monitor ("%b %b %b %b", a, b, q, q1);
		#1 a=0; b=1;
		#1 a=1; b=0;
		#1 a=1; b=1;
		
	end
endmodule// test