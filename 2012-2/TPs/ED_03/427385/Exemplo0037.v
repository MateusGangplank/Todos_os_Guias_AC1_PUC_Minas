// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0037 - F4 - EXTRA01
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385  

// ------------------------- 
// -- selecionador
// ------------------------- 
module selecionador (output [3:0]saida, input [3:0]a, input [3:0]b, input flag);
	
	wire [7:0]s;
	wire saida_not;
	
	not NOT1(saida_not, flag);
	
	and AND1(s[0], a[0], flag);
	and AND2(s[1], a[1], flag);
	and AND3(s[2], a[2], flag);
	and AND4(s[3], a[3], flag);
	
	and AND5(s[4], b[0], saida_not);
	and AND6(s[5], b[1], saida_not);
	and AND7(s[6], b[2], saida_not);
	and AND8(s[7], b[3], saida_not);
	
	or OR1(saida[0], s[0], s[4]);
	or OR2(saida[1], s[1], s[5]);
	or OR3(saida[2], s[2], s[6]);
	or OR4(saida[3], s[3], s[7]);

endmodule // -- selecionador

// ------------------------- 
// -- f4 gate
// ------------------------- 
module f4 (output [3:0]saida, input [3:0]entrada1, input [3:0]entrada2, input chave);
	
	wire [3:0]saida_menor;
	wire [3:0]saida_maior;
	
	or OR1(saida_menor[0], ~entrada1[0], entrada2[0]);
	or OR2(saida_menor[1], ~entrada1[1], entrada2[1]);
	or OR3(saida_menor[2], ~entrada1[2], entrada2[2]);
	or OR4(saida_menor[3], ~entrada1[3], entrada2[3]);
	
	or OR5(saida_maior[0], entrada1[0], ~entrada2[0]);
	or OR6(saida_maior[1], entrada1[1], ~entrada2[1]);
	or OR7(saida_maior[2], entrada1[2], ~entrada2[2]);
	or OR8(saida_maior[3], entrada1[3], ~entrada2[3]);
	
	selecionador SEL1 (saida, saida_maior, saida_menor, chave);
	
endmodule // -- f4

// ------------------------- 
// -- modulo de teste
// ------------------------- 
module test_f4;
	
	reg  [3:0] x;
	reg  [3:0] y;
	reg  f;
	wire [3:0] z;
	
	f4 modulo (z, x, y, f);
	
	// --- parte principal
	initial begin
	$display("Exemplo0037 - EXTRA02 - Guia03 - Ana Cristina - 427385");
	$display("Test LU's module");
	$display("Legenda da chave: 0 - MENOR 1 - MAIOR\n");
	
	#1 x = 4'b1010;	y = 4'b0101; f = 0;
	$monitor("ch = %1b\t x = %4b\t y = %4b\t s = %4b", f, x, y, z);
	#1 x = 4'b1010;	y = 4'b0101;	f = 1;
	
	#1 x = 4'b0000;	y = 4'b1111;	f = 0;
	#1 x = 4'b0000;	y = 4'b1111;	f = 1;
	
	#1 x = 4'b0010;	y = 4'b0101;	f = 0;
	#1 x = 4'b0010;	y = 4'b0101;	f = 1;
	
	end

endmodule // -- test_f4
// ----------------------------------------------- previsao de testes
// -- Legenda da chave: 0 - MENOR 1 - MAIOR
// -- ch = 0	 x = 1010	 y = 0101	 s = 0101
// -- ch = 1	 x = 1010	 y = 0101	 s = 1010
// -- ch = 0	 x = 0000	 y = 1111	 s = 1111
// -- ch = 1	 x = 0000	 y = 1111	 s = 0000
// -- ch = 0	 x = 0010	 y = 0101	 s = 1101
// -- ch = 1	 x = 0010	 y = 0101	 s = 1010