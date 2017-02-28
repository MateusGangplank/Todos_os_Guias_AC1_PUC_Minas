// -- PUC Minas - Instituto de Ciencias Exatas e Informatica
// -- Ciencia da Computacao - Professor Theldo Cruz
// Nome: ANA CRISTINA PEREIRA TEIXEIRA
// Matricula: 427385

// -- 04.) Calcular e mostrar o complemento de 2 de cada um dos valores abaixo armazenados em registrador(es):

// -------------------------
// test number system
// -------------------------
module test_base_01;
	// ------------------------- definir dados
	reg [7:0] a;
	reg [6:0] b;
	reg [5:0] c;
	reg [4:0] d;
	reg [7:0] e;
	
	// ------------------------- parte principal
	initial begin
		$display("Exercicio 0004 - ANA CRISTINA - 427385");
		$display("Test number system");
		
	// -- a.) 101111(2) com 8 bits de comprimento
		a =  ~('b101111) + 1;
	
	// -- b.) 321(4) com 7 bits de comprimento
		b =  ~('b111001) + 1;
	
	// -- c.) 25(10) com 6 bits de comprimento
		c =  ~('b11001) + 1;
			
	// -- d.) D(16) com 5 bits de comprimento
		d =  ~('b1101) + 1;
	
	// -- e.) 24(8) com 8 bits de comprimento
		e =  ~('b010100) + 1;
		
		$display("a = %d = %8b", a, a);
		$display("b = %d = %7b", b, b);
		$display("c = %d = %6b", c, c);
		$display("d = %d = %5b", d, d);
		$display("e = %d = %8b", e, e);
	end
endmodule // test_base

// -- Testes
// Exercicio 0004 - ANA CRISTINA - 427385
// Test number system
// a =   9 = 00001001
// b = 103 = 1100111
// c =  7 = 000111
// d = 19 = 10011
// e = 140 = 10001100