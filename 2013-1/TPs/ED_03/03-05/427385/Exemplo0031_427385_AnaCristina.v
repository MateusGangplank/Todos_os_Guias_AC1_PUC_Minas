// -- PUC Minas - Instituto de Ciencias Exatas e Informatica
// -- Ciencia da Computacao - Professor Theldo Cruz
// Nome: ANA CRISTINA PEREIRA TEIXEIRA
// Matricula: 427385

// Exemplo0031 - F4 

// -------------------------
// --- f4_gate
// -------------------------
module f4 (output [3:0] s, output [3:0] s1, input [3:0] a, input [3:0] b);
	// ------------------------- descrever por portas
	// operacoes logicas bit a bit
	
	and AND1(s[0],a[0],b[0]);
	and AND2(s[1],a[1],b[1]);
	and AND3(s[2],a[2],b[2]);
	and AND4(s[3],a[3],b[3]);
	
	or OR1(s1[0],a[0],b[0]);
	or OR2(s1[1],a[1],b[1]);
	or OR3(s1[2],a[2],b[2]);
	or OR4(s1[3],a[3],b[3]);
endmodule // f4 

module test_f4;
   // ------------------------- definir dados
   reg [3:0] x;
	reg [3:0] y;
	
	wire [3:0] z;
	wire [3:0] z1;
	
	f4 modulo (z, z1, x, y);
	
	// ------------------------- parte principal 
	initial begin
      $display("Exemplo 0031 - ANA CRISTINA - 427385");
      $display("Test LU's module");
      
      x = 4'b0011; y = 4'b0101;
      
      // ------------------------- projetar testes do modulo
      $display("x \ty \tAND \tOR");
      $monitor("%3b \t%3b \t%3b \t%3b", x, y, z, z1);
      #1 x = 4'b0000; y = 4'b1010;
      #1 x = 4'b0001; y = 4'b1011;
      #1 x = 4'b0010; y = 4'b1100;
      #1 x = 4'b0011; y = 4'b1110;
      #1 x = 4'b0100; y = 4'b1111;
      #1 x = 4'b0101; y = 4'b0000;
   end
endmodule // test_f4

// -- Testes
// Exemplo 0031 - ANA CRISTINA - 427385
// Test LU's module
// x 	y 	AND 	OR
// 0011 	0101 	0001 	0111
// 0000 	1010 	0000 	1010
// 0001 	1011 	0001 	1011
// 0010 	1100 	0000 	1110
// 0011 	1110 	0010 	1111
// 0100 	1111 	0100 	1111
// 0101 	0000 	0000 	0101