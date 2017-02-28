// -- PUC Minas - Instituto de Ciencias Exatas e Informatica
// -- Ciencia da Computacao - Professor Theldo Cruz
// Nome: ANA CRISTINA PEREIRA TEIXEIRA
// Matricula: 427385

// -- 05.) Executar as operações abaixo, armazenar seus dados e resultados em registradores
// -- e mostrar os valores resultantes em binário, usar 8 bits e complemento de 2 nas subtrações: 

// -------------------------
// test number system
// -------------------------
module test_base_01;
	// ------------------------- definir dados
	reg [7:0] a, b, c, d, e;
	
	// ------------------------- parte principal
	initial begin
		$display("Exercicio 0005 - ANA CRISTINA - 427385");
		$display("Test number system");
		
	//	-- a.) 101011(2) - 1001(2)
		a = 'b101011 + (~('b1001)+1);
	
	// -- b.) 10011(2) - 15(8)
		b = 'b10011 + (~('o15)+1);
	
	// -- c.) 35(8) - C(16)
		c = 'o35 + (~('hC)+1);
	
	// -- d.) BA(16) - 10111001(2)
		d = 'hBA + (~('b10111001)+1);
	
	// -- e.) 37 - 1B(16)
		e = 37 + (~('h1B)+1);
		
		$display("a = %d = %8b", a, a);
		$display("b = %d = %8b", b, b);
		$display("c = %d = %8b", c, c);
		$display("d = %d = %8b", d, d);
		$display("e = %d = %8b", e, e);
	end
endmodule // test_base

// -- Testes
// Exercicio 0005 - ANA CRISTINA - 427385
// Test number system
// a =  34 = 00100010
// b =   6 = 00000110
// c =  17 = 00010001
// d =   1 = 00000001
// e =  10 = 00001010