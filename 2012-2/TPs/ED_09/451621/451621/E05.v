//Exercicio 05
//Nome: Vitor Angelo Lima
//Matricula: 451621

`include "tff.v"

module teste;
	wire a, b, c, d;
	wire anot, bnot, cnot, dnot;
	wire an, bn, cn, dn;
	reg preset, pulse;
	reg clear;
	
	tff TFFa ( a, anot, 1, bn, preset, clear );
	tff TFFb ( b, anot, 1, cn, preset, clear );
	tff TFFc ( c, anot, 1, dn, preset, clear );
	tff TFFd ( d, anot, pulse, pulse, preset, clear );
	
	not ( an, a );
	not ( bn, b );
	not ( cn, c );
	not ( dn, d );
	
	//clear = an, b, cn, d ... nao consegui implementar ( erros com valores x )
	
	initial begin
		$monitor ( "%d || %b %b %b %b", $time, a, b, c, d );
		preset = 1; clear = 0; pulse = 1;
		#1 pulse = 0; clear = 1;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		#1 pulse = 0;
	end
endmodule
