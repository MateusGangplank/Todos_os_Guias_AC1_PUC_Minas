// -- PUC Minas - Instituto de Ciencias Exatas e Informatica
// -- Ciencia da Computacao - Professor Theldo Cruz
// Nome: ANA CRISTINA PEREIRA TEIXEIRA
// Matricula: 427385

// -- 02.) Executar as operações abaixo, armazenar seus dados e resultados em registradores
// -- e mostrar os valores resultantes em binário, com a menor quantidade de bits necessária:

// -------------------------
// test number system
// -------------------------
module test_base_01;
	// ------------------------- definir dados
	reg [6:0] a;
	reg [5:0] b;
	reg [3:0] c;
	reg [6:0] d;
	reg [9:0] e;
	
	// ------------------------- parte principal
	initial begin
		$display("Exercicio 0002 - ANA CRISTINA - 427385");
		$display("Test number system");
		
	// -- a.) 100110(2) + 11011(2) = 1000001(2)
	// -- 38(10) + 27(10) = 65(10)
		a = 6'b100110 + 5'b11011;
	
	// -- b.) 11101(2) + 25(8) =
	// -- 11101(2) + 10101(2) = 110010(2)
	// -- 29(10) + 21(10) = 50(10)
		b = 5'b11101 + 5'o25;
		
	// -- c.) 1234(8) / 4C(16)
	// -- 668(10) / 76(10) = 8(10)
	// -- 1010011100(2) / 1001100(2) = 1000(2)
		c = 10'o1234 / 7'h4C;
		
	// -- d.) 1BA(16) - 101110011(2)
	// -- 442(10) - 371(10) = 71(10)
	// -- 110111010(2) - 101110011(2) = 1000111(2)
		d = 9'h1BA - 9'b101110011;
	
	// -- e.) 25 * 32(8) + 8A(16) = 25(10) * 32(8) + 8A(16)
	// -- [ 25(10) * 26(10) ] + 138(10) = 650(10) + 138(10) = 788(10)
	// -- [ 11001(2) * 11010(2) ] + 10001010(2) = 1010001010(2) + 10001010(2) = 1100010100(2)
		e = (25 * 5'o32) + 8'h8A;
		
		$display("a = %d = %7b", a, a);
		$display("b = %d = %6b", b, b);
		$display("c = %d = %4b", c, c);
		$display("d = %d = %7b", d, d);
		$display("e = %d = %10b", e, e);
	end
endmodule // test_base

// -- Testes
// Exercicio 0002 - ANA CRISTINA - 427385
// Test number system
// a =  65 = 1000001
// b = 50 = 110010
// c =  8 = 1000
// d =  71 = 1000111
// e =  788 = 1100010100