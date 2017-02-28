// -------------------------------------------------------------------------------
// Exemplo 05_05 - operador de soma completa de 2 bits usando apenas portas nand
// Nome: Mariana Ramos de Brito
// Matricula: 405820
// -------------------------------------------------------------------------------


// ---------------------
// -- meia soma
// ---------------------

module meia_soma (s0, s1, a, b);

	input   a, b;             
	output  s0, s1;
	
	wire sn1, sn2, sn3, sn4;
	
		// instancia
	nand NAND1(sn1, a, b);
	nand NAND2(sn2, a, b);
	nand NAND3(sn3, a, sn1);
	nand NAND4(sn4, sn1, b);
	
	nand NAND5(s0, sn3, sn4);
	nand NAND6(s1, sn2, sn2);

endmodule // meia_soma


// -----------------------
// -- soma completa 1bit
// -----------------------

module soma_comp_1bit (s0, s1, a, b, c);

	input   a, b, c;             
	output  s0, s1;
	
	wire sa1, sa2, sa3, sa4, sa5;
	
		// instancia
	meia_soma MEIA1 (sa1, sa2, a, b);
	meia_soma MEIA2 (s0, sa3, sa1, c);
	
	nand NAND1(sa4, sa2, sa2);
	nand NAND2(sa5, sa3, sa3);
	nand NAND3(s1, sa4, sa5);

endmodule // soma_comp_1bit


// -----------------------
// -- soma completa 2bit
// -----------------------

module soma_comp_2bit (s0, s1, s2, a0, a1, b0, b1);

	input   a0, a1, b0, b1;
	output s0, s1, s2;
	
	wire sa1;
	
		// instancia
	soma_comp_1bit SC1 (s0, sa1, a0, b0, 0);
	soma_comp_1bit SC2 (s1, s2, a1, b1, sa1);

endmodule // soma_comp_2bit


// ---------------------
// -- guia 05_05 teste
// ---------------------


module teste_guia_05_05;

	reg a0, a1, b0, b1;
	wire s0, s1, s2;
	
		// instancia
	soma_comp_2bit SOMAC (s0, s1, s2, a0, a1, b0, b1);

	initial begin:start
		a0=0; a1=0; b0=0; b1=0;
	end

		// parte principal
	initial begin:main
		$display("Guia 05_05 - Mariana Ramos de Brito - 405820");
		$display("Teste do operador de soma completa de numeros com 2 bits cada, usando apenas portas nand.\n");
		$display("a1a0 + b1b0 = s2s1s0\n");
		$monitor("%b%b + %b%b = %b%b%b\n", a1, a0, b1, b0, s2, s1, s0);
		
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

endmodule // guia_05_05