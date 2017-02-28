// ------------------------- 
// Exemplo0016 - BASE - EXERCICIOS
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// -------------------------

// -------------------------
// 01. Executar as operações abaixo, armazenar seus dados e resultados em registradores
// e mostrar os valores resultantes em binário, com a menor quantidade de bits necessária:
// -------------------------
// a.) 2 + 15
// b.) 3 * 8
// c.) 32 / 3
// d.) 21 – 11
// e.) 2 * 5 + 6 - 1 
// -------------------------

module test_operations_01;
// ------------------------- definir dados
	reg [4:0] a;
	reg [4:0] b;
	reg [3:0] c;
	reg [3:0] d;
	reg [3:0] e;
	
// ------------------------- parte principal
initial begin
	$display("Exemplo0016 - EXERCICIOS - Ana Cristina Pereira Teixeira - 427385");
	$display("Exercio0001 - ModuleTest");
	
	a = 2 + 15;
	b =  3 * 8;
	c =  32 / 3;
	d =  21 - 11;
	e = (2 * 5) + 6 - 1;
	
	$display("\nOperations Exercicio0001");
	$display("a.) 2 + 15 = a = %d = %5b", a, a);
	$display("b.) 3 * 8 = b = %d = %5b", b, b);
	$display("c.) 32 / 3 = c = %d = %5b", c, c);
	$display("d.) 21 - 11 = d = %d = %5b", d, d);
	$display("e.) 2 * 5 + 6 - 1 = e = %d = %5b", e, e);
	
end
endmodule // test_base