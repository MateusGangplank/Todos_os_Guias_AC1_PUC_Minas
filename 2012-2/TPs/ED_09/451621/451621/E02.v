//Exercicio 02
//Nome: Vitor Angelo Lima
//Matricula: 451621

`include "jkff.v"

module teste;
	wire a, b, c, d, e;
	wire anot, bnot, cnot, dnot, enot; //saidas com valores indeterminados. Nao sei o motivo
	wire an, bn, cn, dn, en;
	wire x, y, w, z;
	reg j, k;
	reg  pulse;

	initial begin
		  j = 1; k = 0;
		 pulse = 1;
	end

	jkff JKFFe (e, enot, j, k, pulse );
	jkff JKFFd (d, dnot, j, k, e );
	jkff JKFFc (c, cnot, j, k, d );
	jkff JKFFb (b, cnot, j, k, c );
	jkff JKFFa (a, cnot, j, k, b );
	not ( an, a );
	not ( bn, b );
	not ( cn, c );
	not ( dn, d );
	not ( en, e );
	
	initial begin
		$monitor ( "%d || %b %b %b %b %b", $time, an, bn, cn, dn, en );
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
