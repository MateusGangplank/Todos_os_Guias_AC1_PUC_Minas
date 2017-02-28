// -- PUC Minas - Instituto de Ciencias Exatas e Informatica
// -- Ciencia da Computacao - Professor Theldo Cruz
// Nome: ANA CRISTINA PEREIRA TEIXEIRA
// Matricula: 427385

// -- 03.) Calcular e mostrar o complemento de 2 de cada um dos valores abaixo armazenados em registrador(es): 
 
// -------------------------
// test number system
// -------------------------
module test_base_01;
	// ------------------------- definir dados
	reg [5:0] a;
	reg [4:0] b;
	reg [3:0] c;
	reg [5:0] d;
	reg [4:0] e;
	
	// ------------------------- parte principal
	initial begin
		$display("Exercicio 0003 - ANA CRISTINA - 427385");
		$display("Test number system");
		
	// -- a.) 101010(2) = C1(010101) + 1 = 010110(2)
		a = ~(6'b101010) + 1;
		
	// -- b.) 25(8) = 21(10) = 10101(2) = C1(01010) + 1 = 01011(2)
		b = ~(5'o24) + 1;
		
	// -- c.) 27(10) = 11011(2) = C1(00100) + 1 = 00101(2)
		c = ~(27) + 1;
		
	// -- d.) 2C(16) = 44(10) = 101100(2) = C1(010011) + 1 = 10100(2)
		d = ~(6'b101100) + 1;
		
	// -- e.) 25 - 35 = -10(10) = 1 0110(2) = C1(0 1001) + 1 = 1010(2)
		e = ~(-10) + 1;
		
		$display("a = %d = %6b", a, a);
		$display("b = %d = %5b", b, b);
		$display("c = %d = %3b", c, c);
		$display("d = %d = %6b", d, d);
		$display("e = %d = %5b", e, e);
		
	end
endmodule // test_base

// -- Testes
// Exercicio 0003 - ANA CRISTINA - 427385
// Test number system
// a = 22 = 010110
// b = 12 = 01100
// c =  5 = 0101
// d = 20 = 010100
// e = 10 = 01010