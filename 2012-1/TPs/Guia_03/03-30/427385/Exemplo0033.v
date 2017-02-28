// ------------------------- 
// Exemplo0033 - F4 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// -------------------------
 
// ------------------------- 
// --- selecionador
// ------------------------- 
module selecionador (output [1:0]saida, input [1:0]entrada1, input [1:0]entrada2, input chave);
	wire [3:0]s1;
	wire saida_not;
	
	not NOT1(saida_not, chave);
	
	and AND1(s1[0], entrada1[0], chave);
	and AND2(s1[1], entrada1[1], chave);
	
	and AND3(s1[2], entrada2[0], saida_not);
	and AND4(s1[3], entrada2[1], saida_not);
	
	or OR1(saida[0], s1[0], s1[2]);
	or OR2(saida[1], s1[1], s1[3]);
	
endmodule // -- selecionador

// -------------------------
// --- f4_gate
// -------------------------
module f4 ( output [3:0]s, input [1:0]a, input [1:0]b, input f);
	wire [1:0]saida_and;
	wire [1:0]saida_or;
	wire [1:0]saida_nand;
	wire [1:0]saida_nor;
	
	and AND1(saida_and[0], a[0], b[0]);
	and AND2(saida_and[1], a[1], b[1]);
	
	or OR1(saida_or[0], a[0], b[0]);
	or OR2(saida_or[1], a[1], b[1]);
	
	nand NAND1(saida_nand[0], a[0], b[0]);
	nand NAND2(saida_nand[1], a[1], b[1]);
	
	nor NOR1(saida_nor[0], a[0], b[0]);
	nor NOR2(saida_nor[1], a[1], b[1]);
	
	selecionador SEL1 (s[1:0], saida_nand, saida_and, f);
	selecionador SEL2 (s[3:2], saida_nor, saida_or, f);
	
endmodule // -- f4

// -------------------------
// --- modulo de teste
// -------------------------
module test_f4;
	
	reg  [1:0] x;
	reg  [1:0] y;
	reg  flag;
	
	wire [3:0] z;
	
	f4 modulo (z, x, y, flag);
	
	// -- parte principal
	initial begin
	
	$display("Exemplo0033 - Ana Cristina Pereira Teixeira - 427385");
	$display("Test LU's module");
   $display("Legenda da chave: 0-OR/AND 1-NOR/NAND \n");
	
	#1 x = 2'b01; y = 2'b10; flag = 0;
	$monitor("Flag = %1b\t x = %2b\t y = %2b\t Saida = %2b\t Saida1 = %2b", flag, x, y, z[1:0],z[3:2]);
	#1 x = 2'b01; y = 2'b10; flag = 1;
	
	#1 x = 2'b11; y = 2'b00; flag = 0;
	#1 x = 2'b11; y = 2'b00; flag = 1;
	
	#1 x = 2'b10; y = 2'b10; flag = 0;
	#1 x = 2'b10; y = 2'b10; flag = 1;
	
	#1 x = 2'b01; y = 2'b00; flag = 0;
	#1 x = 2'b01; y = 2'b00; flag = 1;
	
	end
endmodule // -- test_f4
// --- previsao de testes
// -- Saida eh AND | NAND e Saida1 eh OR | NOR
// -- Flag = 0	 x = 01	 y = 10	 Saida = 00	 Saida1 = 11
// -- Flag = 1	 x = 01	 y = 10	 Saida = 11	 Saida1 = 00
// -- Flag = 0	 x = 11	 y = 00	 Saida = 00	 Saida1 = 11
// -- Flag = 1	 x = 11	 y = 00	 Saida = 11	 Saida1 = 00
// -- Flag = 0	 x = 10	 y = 10	 Saida = 10	 Saida1 = 10
// -- Flag = 1	 x = 10	 y = 10	 Saida = 01	 Saida1 = 01
// -- Flag = 0	 x = 01	 y = 00	 Saida = 00	 Saida1 = 01
// -- Flag = 1	 x = 01	 y = 00	 Saida = 11	 Saida1 = 10
