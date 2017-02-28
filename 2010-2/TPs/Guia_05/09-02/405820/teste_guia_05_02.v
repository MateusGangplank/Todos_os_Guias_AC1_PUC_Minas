// ----------------------------------------------------------------------
// Exemplo 05_02 - operador de diferenca completa de numeros com 2 bits
// Nome: Mariana Ramos de Brito
// Matricula: 405820
// ----------------------------------------------------------------------


// ---------------------
// -- meia_diferença
// ---------------------

module meia_subt (s0, s1, a, b);
	
	input   a, b;
	output s0, s1;
	
	wire sa1;
	
		// instancia	
	xor XOR1(s0,a, b);
	not NOT1(sa1, a);
	and AND1(s1, sa1, b);
	
endmodule // meia_subt


// -------------------------
// -- subt completa de 1 bit
// -------------------------

module subt_comp_1b (s0, s1, a, b, c);
	
		// operador de diferença completa de 1 bit
	
	input   a, b, c;
	output s0, s1;
	
	wire sa1, sa2, sa3;
	
		// instancia	
	meia_subt SUBT1 (sa1, sa2, a, b);
	meia_subt SUBT2 (s0, sa3, sa1, c);
	or OR1 (s1, sa2, sa3);
	
endmodule // subt_comp_1b


// ----------------------------
// -- subt completa de 2 bits
// ----------------------------

module subt_completa_2bit (s0, s1, s2, a0, a1, b0, b1);
	
		// operador de subtracao completa de 2 bits
	
	input   a0, a1, b0, b1;
	output s0, s1, s2;
	
	wire sa1;
	
		// instancia	
	subt_comp_1b SC1(s0, sa1, a0, b0, 0);
	subt_comp_1b SC2(s1, s2, a1, b1, sa1);
	
endmodule // subt_completa_2bit


// ---------------------
// -- guia 05_02 teste
// ---------------------


module teste_guia_05_02;

	reg a0, a1, b0, b1;
	wire s0, s1, s2;
	
		// instancia
	subt_completa_2bit SUBTC2B (s0, s1, s2, a0, a1, b0, b1);

	initial begin:start
		a0=0; a1=0; b0=0; b1=0;
	end

		// parte principal
	initial begin:main
		$display("Guia 05_02 - Mariana Ramos de Brito - 405820");
		$display("Teste do operador de subtracao completa de numeros com 2 bits cada.\n");
		$display("a1a0 - b1b0 = s2s1s0\n");
		$monitor("%b%b - %b%b = %b%b%b\n", a1, a0, b1, b0, s2, s1, s0);
		
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

endmodule // guia_05_02