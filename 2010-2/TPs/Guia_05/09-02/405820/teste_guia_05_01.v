// -------------------------------------------------------------------
// Exemplo 05_01 - operador de soma completa de numeros com 3 bits
// Nome: Mariana Ramos de Brito
// Matricula: 405820
// -------------------------------------------------------------------


// ---------------------
// -- meia_soma
// ---------------------

module meia_soma (s0, s1, a, b);
	
	input   a, b;
	output s0, s1;
	
		// instancia	
	xor XOR1(s0,a, b);
	and AND1(s1, a, b);
	
endmodule // meia_soma


// --------------------------
// -- soma completa de 1 bit
// --------------------------

module soma_completa_1bit (s0, s1, a, b, c);
	
		// operador de soma completa de 1 bit
	
	input   a, b, c;
	output s0, s1;
	
	wire sa1, sa2, sa3;
	
		// instancia	
	meia_soma MEIA1 (sa1, sa2, a, b);
	meia_soma MEIA2 (s0, sa3, sa1, c);
	or OR1 (s1, sa2, sa3);
	
endmodule // soma_completa_1bit


// ----------------------------
// -- soma completa de 3 bits
// ----------------------------

module soma_completa_3bit (s0, s1, s2, s3, a0, a1, a2, b0, b1, b2);
	
		// operador de soma completa de 3 bits
	
	input   a0, a1, a2, b0, b1, b2;
	output s0, s1, s2, s3;
	
	wire sa1, sa2;
	
		// instancia	
	soma_completa_1bit SC1(s0, sa1, a0, b0, 0);
	soma_completa_1bit SC2(s1, sa2, a1, b1, sa1);
	soma_completa_1bit SC3(s2, s3, a2, b2, sa2);
	
endmodule // soma_completa_3bit


// ---------------------
// -- guia 05_01 teste
// ---------------------


module teste_guia_05_01;

	reg a0, a1, a2, b0, b1, b2;
	wire s0, s1, s2, s3;
	
		// instancia
	soma_completa_3bit SOMAC3B (s0, s1, s2, s3, a0, a1, a2, b0, b1, b2);

	initial begin:start
		a0=0; a1=0; a2=0; b0=0; b1=0; b2=0;
	end

		// parte principal
	initial begin:main
		$display("Guia 05_01 - Mariana Ramos de Brito - 405820");
		$display("Teste do operador de soma completa de numeros com 3 bits cada.\n");
		$display("a2a1a0 + b2b1b0 = s3s2s1s0\n");
		$monitor("%b%b%b + %b%b%b = %b%b%b%b\n", a2, a1, a0, b2, b1, b0, s3, s2, s1, s0);
		
		#1 a2=0; a1=0; a0=1; b2=0; b1=0; b0=0;
		#1 a2=0; a1=1; a0=0; b2=0; b1=0; b0=0;
		#1 a2=0; a1=1; a0=1; b2=0; b1=0; b0=0;
		#1 a2=1; a1=0; a0=0; b2=0; b1=0; b0=0;
		#1 a2=1; a1=0; a0=1; b2=0; b1=0; b0=0;
		#1 a2=1; a1=1; a0=0; b2=0; b1=0; b0=0;
		#1 a2=1; a1=1; a0=1; b2=0; b1=0; b0=0;
		
		#1 a2=0; a1=0; a0=0; b2=0; b1=0; b0=1;
		#1 a2=0; a1=0; a0=1; b2=0; b1=0; b0=1;
		#1 a2=0; a1=1; a0=0; b2=0; b1=0; b0=1;
		#1 a2=0; a1=1; a0=1; b2=0; b1=0; b0=1;
		#1 a2=1; a1=0; a0=0; b2=0; b1=0; b0=1;
		#1 a2=1; a1=0; a0=1; b2=0; b1=0; b0=1;
		#1 a2=1; a1=1; a0=0; b2=0; b1=0; b0=1;
		#1 a2=1; a1=1; a0=1; b2=0; b1=0; b0=1;
		
		#1 a2=0; a1=0; a0=0; b2=0; b1=1; b0=0;
		#1 a2=0; a1=0; a0=1; b2=0; b1=1; b0=0;
		#1 a2=0; a1=1; a0=0; b2=0; b1=1; b0=0;
		#1 a2=0; a1=1; a0=1; b2=0; b1=1; b0=0;
		#1 a2=1; a1=0; a0=0; b2=0; b1=1; b0=0;
		#1 a2=1; a1=0; a0=1; b2=0; b1=1; b0=0;
		#1 a2=1; a1=1; a0=0; b2=0; b1=1; b0=0;
		#1 a2=1; a1=1; a0=1; b2=0; b1=1; b0=0;
		
		#1 a2=0; a1=0; a0=0; b2=0; b1=1; b0=1;
		#1 a2=0; a1=0; a0=1; b2=0; b1=1; b0=1;
		#1 a2=0; a1=1; a0=0; b2=0; b1=1; b0=1;
		#1 a2=0; a1=1; a0=1; b2=0; b1=1; b0=1;
		#1 a2=1; a1=0; a0=0; b2=0; b1=1; b0=1;
		#1 a2=1; a1=0; a0=1; b2=0; b1=1; b0=1;
		#1 a2=1; a1=1; a0=0; b2=0; b1=1; b0=1;
		#1 a2=1; a1=1; a0=1; b2=0; b1=1; b0=1;
		
		#1 a2=0; a1=0; a0=0; b2=1; b1=0; b0=0;
		#1 a2=0; a1=0; a0=1; b2=1; b1=0; b0=0;
		#1 a2=0; a1=1; a0=0; b2=1; b1=0; b0=0;
		#1 a2=0; a1=1; a0=1; b2=1; b1=0; b0=0;
		#1 a2=1; a1=0; a0=0; b2=1; b1=0; b0=0;
		#1 a2=1; a1=0; a0=1; b2=1; b1=0; b0=0;
		#1 a2=1; a1=1; a0=0; b2=1; b1=0; b0=0;
		#1 a2=1; a1=1; a0=1; b2=1; b1=0; b0=0;
		
		#1 a2=0; a1=0; a0=0; b2=1; b1=0; b0=1;
		#1 a2=0; a1=0; a0=1; b2=1; b1=0; b0=1;
		#1 a2=0; a1=1; a0=0; b2=1; b1=0; b0=1;
		#1 a2=0; a1=1; a0=1; b2=1; b1=0; b0=1;
		#1 a2=1; a1=0; a0=0; b2=1; b1=0; b0=1;
		#1 a2=1; a1=0; a0=1; b2=1; b1=0; b0=1;
		#1 a2=1; a1=1; a0=0; b2=1; b1=0; b0=1;
		#1 a2=1; a1=1; a0=1; b2=1; b1=0; b0=1;
		
		#1 a2=0; a1=0; a0=0; b2=1; b1=1; b0=0;
		#1 a2=0; a1=0; a0=1; b2=1; b1=1; b0=0;
		#1 a2=0; a1=1; a0=0; b2=1; b1=1; b0=0;
		#1 a2=0; a1=1; a0=1; b2=1; b1=1; b0=0;
		#1 a2=1; a1=0; a0=0; b2=1; b1=1; b0=0;
		#1 a2=1; a1=0; a0=1; b2=1; b1=1; b0=0;
		#1 a2=1; a1=1; a0=0; b2=1; b1=1; b0=0;
		#1 a2=1; a1=1; a0=1; b2=1; b1=1; b0=0;
		
		#1 a2=0; a1=0; a0=0; b2=1; b1=1; b0=1;
		#1 a2=0; a1=0; a0=1; b2=1; b1=1; b0=1;
		#1 a2=0; a1=1; a0=0; b2=1; b1=1; b0=1;
		#1 a2=0; a1=1; a0=1; b2=1; b1=1; b0=1;
		#1 a2=1; a1=0; a0=0; b2=1; b1=1; b0=1;
		#1 a2=1; a1=0; a0=1; b2=1; b1=1; b0=1;
		#1 a2=1; a1=1; a0=0; b2=1; b1=1; b0=1;
		#1 a2=1; a1=1; a0=1; b2=1; b1=1; b0=1;
  		
	end

endmodule // guia_05_01