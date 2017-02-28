// -- PUC Minas - Instituto de Ciencias Exatas e Informatica
// -- Ciencia da Computacao - Professor Theldo Cruz
// Nome: ANA CRISTINA PEREIRA TEIXEIRA
// Matricula: 427385

// Exemplo0036 - F4 

// -------------------------
// --- selecionador 
// -------------------------
module selecionador (output [3:0]saida, input [3:0]entrada1, input [3:0]entrada2, input chave);
   wire [7:0]s;
   wire saida_not;
   
   not NOT1(saida_not, chave);
   
   and AND1(s[0], entrada1[0], chave);
	and AND2(s[1], entrada1[1], chave);
	and AND3(s[2], entrada1[2], chave);
	and AND4(s[3], entrada1[3], chave);
	
	and AND5(s[4], entrada2[0], saida_not);
	and AND6(s[5], entrada2[1], saida_not);
	and AND7(s[6], entrada2[2], saida_not);
	and AND8(s[7], entrada2[3], saida_not);
	
	or OR1(saida[0], s[0], s[4]);
	or OR2(saida[1], s[1], s[5]);
	or OR3(saida[2], s[2], s[6]);
	or OR4(saida[3], s[3], s[7]);

endmodule // -- selecionador

// -------------------------
// --- f4 gate
// -------------------------
module f4 (output [3:0]saida, input [3:0]a, input [3:0]b, input f);
   
   wire [3:0]saida_xor, saida_xnor;
   
   xor XOR1(saida_xor[0], a[0], b[0]);
	xor XOR2(saida_xor[1], a[1], b[1]);
	xor XOR3(saida_xor[2], a[2], b[2]);
	xor XOR4(saida_xor[3], a[3], b[3]);
	
	xnor XNOR1(saida_xnor[0], a[0], b[0]);
	xnor XNOR2(saida_xnor[1], a[1], b[1]);
	xnor XNOR3(saida_xnor[2], a[2], b[2]);
	xnor XNOR4(saida_xnor[3], a[3], b[3]);
	
	selecionador SEL1 (saida, saida_xor, saida_xnor, f);

endmodule // -- f4

// ------------------------- 
// -- modulo de teste
// -------------------------
module test_f4;
	
	reg  [3:0] x, y;
	reg  flag;
	wire [3:0] z;
	
	f4 modulo (z, x, y, flag);
	
	// -- parte principal
	initial begin
      $display("Exemplo 0036 - ANA CRISTINA - 427385");
      $display("Test LU's module");
      $display("Legenda da chave: 0 - IGUAL\t 1 - DIFERENTE \n");
      
      #1 x = 4'b0011;	y = 4'b0101;	flag = 0;
      $monitor("ch = %1b\t x = %4b\t y = %4b\t s = %4b", flag, x, y, z);
      #1 x = 4'b0011;	y = 4'b0101;	flag = 1;
      #1 x = 4'b0000;	y = 4'b1111;	flag = 0;
      #1 x = 4'b0000;	y = 4'b1111;	flag = 1;
      #1 x = 4'b1010;	y = 4'b0101;	flag = 0;
      #1 x = 4'b1010;	y = 4'b0101;	flag = 1;
   end
endmodule // -- test_f4

// -- Testes
// Exemplo 0036 - ANA CRISTINA - 427385
// Test LU's module
// Legenda da chave: 0 - IGUAL	 1 - DIFERENTE
// ch = 0	 x = 0011	 y = 0101	 s = 1001
// ch = 1	 x = 0011	 y = 0101	 s = 0110
// ch = 0	 x = 0000	 y = 1111	 s = 0000
// ch = 1	 x = 0000	 y = 1111	 s = 1111
// ch = 0	 x = 1010	 y = 0101	 s = 0000
// ch = 1	 x = 1010	 y = 0101	 s = 1111