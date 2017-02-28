//Exercicio 03
//Nome: Vitor Angelo Lima
//Matricula: 451621

`include "jkff.v"

module teste;
	wire a, b, c, d, e, f;
	wire anot, bnot, cnot, dnot, enot, fnot; //saidas nao confiaveis
	wire an, bn, cn, dn, en, fn;
	reg j, k;
	reg  pulse;

	initial begin
		  j = 0; k = 1;
		 pulse = 1;
	end

	jkff JKFFa ( a, cnot, j, k, pulse );
	jkff JKFFb ( b, cnot, j, k, an);
	jkff JKFFc ( c, cnot, j, k, bn );
	jkff JKFFd ( d, dnot, j, k, cn );
	jkff JKFFe ( e, enot, j, k, dn );
	jkff JKFFf ( f, fnot, j, k, en );
	
	not ( an, a );
	not ( bn, b );
	not ( cn, c );
	not ( dn, d );
	not ( en, e );
	
	initial begin
		$monitor ( "%d || %b %b %b %b %b", $time, e, d, c, b, a );
		#1 pulse = 0; j=1; k=1;
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
