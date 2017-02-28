// -- PUC Minas - Instituto de Ciencias Exatas e Informatica
// -- Ciencia da Computacao - Professor Theldo Cruz
// Nome: ANA CRISTINA PEREIRA TEIXEIRA
// Matricula: 427385

// Exemplo0032 - F4 

// -------------------------
// --- selecionador
// -------------------------
module selecionador (output [1:0]saida, input [1:0]entrada1, input [1:0]entrada2, input chave);
	wire [3:0] s1;
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
module f4 (output [1:0]s, input [1:0]a, input [1:0]b, input f);
	wire [1:0] saida_and;
	wire [1:0] saida_or;
	
	and AND1(saida_and[0], a[0], b[0]);
	and AND2(saida_and[1], a[1], b[1]);
	
	or OR1(saida_or[0], a[0], b[0]);
	or OR2(saida_or[1], a[1], b[1]);
	
	selecionador SEL1 (s, saida_and, saida_or, f);
	
endmodule // -- f4

// -------------------------
// --- modulo de teste
// -------------------------
module test_f4;
   
   reg  [1:0] x, y;
   reg  f;
   wire [1:0] z;
   
   f4 modulo (z, x, y, f);
   
   // -- parte principal
   initial begin
      $display("Exemplo 0032 - ANA CRISTINA - 427385");
      $display("Test LU's module");
      $display("Legenda da chave: O-OR 1-AND \n");
      
      #1 x = 2'b01; y = 2'b10; f = 0;
      
      $monitor("ch = %1b\t x = %2b\t y = %2b\t s = %3b", f, x, y, z);
      #1 x = 2'b01; y = 2'b10; f = 1;
      #1 x = 2'b11; y = 2'b00; f = 0;
      #1 x = 2'b11; y = 2'b00; f = 1;
      #1 x = 2'b10; y = 2'b10; f = 0;
      #1 x = 2'b10; y = 2'b10; f = 1;
      #1 x = 2'b01; y = 2'b00; f = 0;
      #1 x = 2'b01; y = 2'b00; f = 1;
   end
endmodule // -- test_f4

// -- Testes
// Exemplo 0032 - ANA CRISTINA - 427385
// Test LU's module
// Legenda da chave: O-OR 1-AND
// ch = 0	 x = 01	 y = 10	 s =  11
// ch = 1	 x = 01	 y = 10	 s =  00
// ch = 0	 x = 11	 y = 00	 s =  11
// ch = 1	 x = 11	 y = 00	 s =  00
// ch = 0	 x = 10	 y = 10	 s =  10
// ch = 1	 x = 10	 y = 10	 s =  10
// ch = 0	 x = 01	 y = 00	 s =  01
// ch = 1	 x = 01	 y = 00	 s =  00