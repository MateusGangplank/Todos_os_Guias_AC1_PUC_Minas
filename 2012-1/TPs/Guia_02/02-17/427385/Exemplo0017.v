// ------------------------- 
// Exemplo0017 - BASE - EXERCICIOS
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// -------------------------

// -------------------------
// 02. Executar as operações abaixo, armazenar seus dados e resultados em registradores
// e mostrar os valores resultantes em binário, com a menor quantidade de bits necessária:
// -------------------------
// a.) 101010(2) + 11010(2)
// b.) 11010(2) + 25(8)
// c.) 1234(8) / 2B(16)
// d.) 1CA(16) - 101110001(2)
// e.) 25 * 31(8) + 7A(16)
// -------------------------

	module test_operations_02;
// ------------------------- definir dados
	reg [6:0] a; // 7 bits
	reg [5:0] b; // 6 bits
	reg [3:0] c; // 4 bits
	reg [6:0] d; // 7 bits
	reg [9:0] e; // 10 bits
// ------------------------- parte principal
	initial begin
		$display("Exemplo0017 - EXERCICIOS - Ana Cristina Pereira Teixeira - 427385");
		$display("Exercio0002 - ModuleTest");
		
		a = 7'b101010 + 7'b11010;
		b =  5'b11010 + 6'o25;
		c =  12'o1234 / 6'b101011;
		d =  9'h1CA - 9'b101110001;
		e = (25 * 5'o31) + 7'h7A;
		
		$display("\nOperations Exercicio0002");
		$display("a.) 101010(2) + 11010(2) = a = %d = %7b", a, a);
		$display("b.) 11010(2) + 25(8) = b = %d = %6b", b, b);
		$display("c.) 1234(8) + 2B(16) = c = %d = %12b", c, c);
		$display("d.) 1CA(16) - 101110001(2) = d = %d = %7b", d, d);
		$display("e.) 25 * 31(8) + 7A(16) = e = %d = %10b", e, e);
	end
endmodule // test_base