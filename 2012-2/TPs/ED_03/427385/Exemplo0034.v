// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0034 - F4
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385 
 
// ------------------------- 
// --- selecionador
// -------------------------
module selecionador (output [1:0]saida, input [1:0]e1, input [1:0]e2, input ch);
	wire [3:0]s1;
	wire saida_not;
	
	not NOT1(saida_not, ch);
	
	and AND1(s1[0], e1[0], ch);
	and AND2(s1[1], e1[1], ch);
	
	and AND3(s1[2], e2[0], saida_not);
	and AND4(s1[3], e2[1], saida_not);
	
	or OR1(saida[0], s1[0], s1[2]);
	or OR2(saida[1], s1[1], s1[3]);
	
endmodule // -- selecionador

// -------------------------
// --- f4_gate
// -------------------------
module f4 (output [1:0]s, input [1:0]a, input [1:0]b, input flag1, input flag2);
	wire [1:0]saida_xor;
	wire [1:0]saida_or;
	wire [1:0]saida_xnor;
	wire [1:0]saida_nor;
	
	wire [1:0]s1;
	wire [1:0]s2;
	
	xor XOR1(saida_xor[0], a[0], b[0]);
	xor XOR2(saida_xor[1], a[1], b[1]);
	
	or OR1(saida_or[0], a[0], b[0]);
	or OR2(saida_or[1], a[1], b[1]);
	
	xnor XNOR1(saida_xnor[0], a[0], b[0]);
	xnor XNOR2(saida_xnor[1], a[1], b[1]);
	
	nor NOR1(saida_nor[0], a[0], b[0]);
	nor NOR2(saida_nor[1], a[1], b[1]);
	
	selecionador SEL1 (s1, saida_xor, saida_or, flag1);
	selecionador SEL2 (s2, saida_xnor, saida_nor, flag1);
	selecionador SEL3 (s, s2, s1, flag2);
	
endmodule // -- f4

// -------------------------
// --- modulo de teste
// -------------------------
module test_f4;
	
	reg  [1:0] x;
	reg  [1:0] y;
	reg  f1;
	reg  f2;
	
	wire [1:0] z;
	
	f4 modulo (z, x, y, f1, f2);
	
	// -- parte principal
	initial begin
	
	$display("Exemplo0034 - Guia03 - Ana Cristina - 427385");
	$display("Test LU's module");
 	$display("Legenda da chave: 00-OR; 01-NOR; 10-XOR; 11-XNOR\n");
	
	#1 x = 2'b01; y = 2'b10; f1 = 0; f2 = 0;
	$monitor("ch = %2b%2b \t x = %2b\t y = %2b\t s = %2b", f1, f2, x, y, z);
	#1 x = 2'b01; y = 2'b10; f1 = 0; f2 = 1; 
	#1 x = 2'b01; y = 2'b10; f1 = 1; f2 = 0;
	#1 x = 2'b01; y = 2'b10; f1 = 1; f2 = 1;
	
	#1 x = 2'b11; y = 2'b00; f1 = 0; f2 = 0;
	#1 x = 2'b11; y = 2'b00; f1 = 0; f2 = 1; 
	#1 x = 2'b11; y = 2'b00; f1 = 1; f2 = 0;
	#1 x = 2'b11; y = 2'b00; f1 = 1; f2 = 1;
		
	#1 x = 2'b10; y = 2'b10; f1 = 0; f2 = 0;
	#1 x = 2'b10; y = 2'b10; f1 = 0; f2 = 1; 
	#1 x = 2'b10; y = 2'b10; f1 = 1; f2 = 0;
	#1 x = 2'b10; y = 2'b10; f1 = 1; f2 = 1;
		 
	#1 x = 2'b01; y = 2'b00; f1 = 0; f2 = 0;
	#1 x = 2'b01; y = 2'b00; f1 = 0; f2 = 1; 
	#1 x = 2'b01; y = 2'b00; f1 = 1; f2 = 0;
	#1 x = 2'b01; y = 2'b00; f1 = 1; f2 = 1;

	end
endmodule // -- test_f4
// ---------------------------------------------------- previsao de testes
// -- Legenda da chave: 00-OR; 01-NOR; 10-XOR; 11-XNOR
// -- ch =  0 0 	 x = 01	 y = 10	 s = 11
// -- ch =  0 1 	 x = 01	 y = 10	 s = 00
// -- ch =  1 0 	 x = 01	 y = 10	 s = 11
// -- ch =  1 1 	 x = 01	 y = 10	 s = 00
// -- ch =  0 0 	 x = 11	 y = 00	 s = 11
// -- ch =  0 1 	 x = 11	 y = 00	 s = 00
// -- ch =  1 0 	 x = 11	 y = 00	 s = 11
// -- ch =  1 1 	 x = 11	 y = 00	 s = 00
// -- ch =  0 0 	 x = 10	 y = 10	 s = 10
// -- ch =  0 1 	 x = 10	 y = 10	 s = 01
// -- ch =  1 0 	 x = 10	 y = 10	 s = 00
// -- ch =  1 1 	 x = 10	 y = 10	 s = 11
// -- ch =  0 0 	 x = 01	 y = 00	 s = 01
// -- ch =  0 1 	 x = 01	 y = 00	 s = 10
// -- ch =  1 0 	 x = 01	 y = 00	 s = 01
// -- ch =  1 1 	 x = 01	 y = 00	 s = 10