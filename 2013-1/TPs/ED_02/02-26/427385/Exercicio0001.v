// -- PUC Minas - Instituto de Ciencias Exatas e Informatica
// -- Ciencia da Computacao - Professor Theldo Cruz
// Nome: ANA CRISTINA PEREIRA TEIXEIRA
// Matricula: 427385

// -- 01.) Executar as operações abaixo, armazenar seus dados e resultados em registradores
// -- e mostrar os valores resultantes em binário, com a menor quantidade de bits necessária

// -------------------------
// test number system
// -------------------------
module test_base_01;
	// ------------------------- definir dados
	reg [4:0] a;
	reg [4:0] b;
	reg [3:0] c;
	reg [4:0] d;
	reg [4:0] e;
	
	// ------------------------- parte principal
	initial begin
		$display("Exercicio 0001 - ANA CRISTINA - 427385");
		$display("Test number system");
		
	//	-- a.) 3 + 14 = 17
		a = (3+14);
		
	//	-- b.) 3 * 8 = 24
		b = (3*8);
		
	//	-- c.) 33 / 5 = 6,6
		c = (33/5);
		
	//	-- d.) 25 - 11 = 14
		d = (25-11);
		
	//	-- e.) 2 * 8 + 7 - 1 = 22
		e = ((2*8)+7-1);
		
		$display("a = %d = %5b", a, a);
		$display("b = %d = %5b", b, b);
		$display("c = %d = %4b", c, c);
		$display("d = %d = %5b", d, d);
		$display("e = %d = %5b", e, e);
		
	end
endmodule // test_base

// -- Testes
// Exercicio 0001 - ANA CRISTINA - 427385
// Test number system
// a = 17 = 10001
// b = 24 = 11000
// c =  6 = 0110
// d = 14 = 01110
// e = 22 = 10110