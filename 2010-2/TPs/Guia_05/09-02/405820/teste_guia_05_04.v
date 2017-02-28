// ----------------------------------------------------------------------------------------------
// Exemplo 05_04 - operador de diferença completa de numeros de 2 bits usando apenas portas nor
// Nome: Mariana Ramos de Brito
// Matricula: 405820
// ----------------------------------------------------------------------------------------------


// ----------------------
// -- meia_diferença_nor
// ----------------------

module meia_subt (s0, s1, a, b);
	
	input   a, b;    
	output s0, s1;
	         
	wire  sn1, sn2, sn3, sn4, sn5, sn6, sn7;
	
		// instancia
	nor NOR1(sn1, a, a);
	nor NOR2(sn2, b, b);
	nor NOR3(sn3, a, b);
	nor NOR4(sn4, a, a);
	nor NOR5(sn5, sn1, sn2);
	nor NOR6(sn6, sn4, sn4);
	nor NOR7(sn7, b, b);
	
	nor NOR8(s0, sn5, sn3);
	nor NOR9(s1, sn6, sn7);
	
endmodule // meia_subt


// ---------------------
// -- subt_comp_1bit
// ---------------------

module subt_comp_1bit (s0, s1, a, b, c);
	
		// operador de diferença completa de 1 bit
	
	input   a, b, c;
	output s0, s1;
	
	wire sa1, sa2, sa3, sa4;
	
		// instancia	
	meia_subt SUBT1 (sa1, sa2, a, b);
	meia_subt SUBT2 (s0, sa3, sa1, c);
	nor NOR1(sa4, sa2, sa3);
	nor NOR2(s1, sa4, sa4);
	
endmodule // subt_comp_1bit


// ---------------------
// -- subt_comp_2bit
// ---------------------

module subt_comp_2bit (s0, s1, s2, a0, a1, b0, b1);
	
		// operador de diferença completa de 2 bit
	
	input   a0, a1, b0, b1;
	output s0, s1, s2;
	
	wire sa1;
	
		// instancia	
	subt_comp_1bit SUBT1 (s0, sa1, a0, b0, 0);
	subt_comp_1bit SUBT2 (s1, s2, a1, b1, sa1);
	
endmodule // subt_comp_2bit


// ---------------------
// -- guia 05_04 teste
// ---------------------


module teste_guia_05_04;

	reg a0, a1, b0, b1;
	wire s0, s1, s2;
	
		// instancia
	subt_comp_2bit SUBTC (s0, s1, s2, a0, a1, b0, b1);

	initial begin:start
		a0=0; a1=0; b0=0; b1=0;
	end

		// parte principal
	initial begin:main
		$display("Guia 05_04 - Mariana Ramos de Brito - 405820");
		$display("Teste do operador de subtracao completa de numeros com 2 bits cada, usando apenas portas nor.\n");
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

endmodule // guia_05_04