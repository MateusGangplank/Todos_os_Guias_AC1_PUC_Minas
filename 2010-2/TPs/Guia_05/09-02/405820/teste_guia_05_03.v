// ----------------------------------------------------------------------
// Exemplo 05_03 - operador de produto completo de numeros com 2 bits
// Nome: Mariana Ramos de Brito
// Matricula: 405820
// ----------------------------------------------------------------------


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


// -----------------------------
// -- produto completo de 2 bits
// -----------------------------

module prod_comp_2bits (s0, s1, s2, s3, a0, a1, b0, b1);
	
		// operador de produto completo de 2 bits
	
	input   a0, a1, b0, b1;
	output s0, s1, s2, s3;
	
	wire sa1, sa2, sa3, sa4;
	
		// instancia	
	and AND1(s0, a0, b0);
	and AND2(sa1, a0, b1);
	and ADN3(sa2, a1, b0);
	and AND4(sa3, a1, b1);
		
	meia_soma MS1(s1, sa4, sa1, sa2);
	soma_completa_1bit SC1(s2, s3, sa3, 0, sa4);
	
endmodule // prod_comp_2bits


// ---------------------
// -- guia 05_03 teste
// ---------------------


module teste_guia_05_03;

	reg a0, a1, b0, b1;
	wire s0, s1, s2, s3;
	
		// instancia
	prod_comp_2bits PRODC2B (s0, s1, s2, s3, a0, a1, b0, b1);

	initial begin:start
		a0=0; a1=0; b0=0; b1=0;
	end

		// parte principal
	initial begin:main
		$display("Guia 05_03 - Mariana Ramos de Brito - 405820");
		$display("Teste do operador de produto completo de numeros com 2 bits cada.\n");
		$display("a1a0 x b1b0 = s3s2s1s0\n");
		$monitor("%b%b x %b%b = %b%b%b%b\n", a1, a0, b1, b0, s3, s2, s1, s0);
		
		#1 a1=0; a0=1; b1=0; b0=0;
		#1 a1=1; a0=0; b1=0; b0=0;
		#1 a1=1; a0=1; b1=0; b0=0;
		
		#1 a1=0; a0=0; b1=0; b0=1;
		#1 a1=0; a0=1; b1=0; b0=1;
		#1 a1=1; a0=0; b1=0; b0=1;
		#1 a1=1; a0=1; b1=0; b0=1;
		
		#1 a1=0; a0=0; b1=1; b0=0;
		#1 a1=0; a0=1; b1=1; b0=0;
		#1 a1=1; a0=0; b1=1; b0=0;
		#1 a1=1; a0=1; b1=1; b0=0;
		
		#1 a1=0; a0=0; b1=1; b0=1;
		#1 a1=0; a0=1; b1=1; b0=1;
		#1 a1=1; a0=0; b1=1; b0=1;
		#1 a1=1; a0=1; b1=1; b0=1;
  		
	end

endmodule // guia_05_03