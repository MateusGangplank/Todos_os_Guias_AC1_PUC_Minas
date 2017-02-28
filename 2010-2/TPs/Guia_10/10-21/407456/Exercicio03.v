// FAVOR COLOCAR NOME E MATRICULA AQUI

module latchD (q, q1, d, c);

	input d, c;
	output q, q1;
	wire w1, w2;
	
	nand (w1, d, c);
	nand (w2, ~d, c);
	nand (q, w1, q1);
	nand (q1, w2, q);

endmodule //latchD

module Exercicio03;

	reg a, b;
	wire q, q1;
	
	latchD L1 (q, q1, a, b);
	
	initial
	begin
		
		$display ("Exercicio 3");
		$display ("Teste de Latch D");
		$display ("");
		$display ("D C Q ~Q");
		
		a=0; b=0;
		
		$monitor ("%b %b %b %b", a, b, q, q1);
		
		#1 a=0; b=1;
		#1 a=1; b=0;
		#1 a=1; b=1;
		
	end
endmodule //Exercicio 3