// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exercicio0001
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// 01.) Executar as operações abaixo,
// armazenar seus dados e resultados em registradores
// e mostrar os valores resultantes em binário,
// com a menor quantidade de bits necessária:
// a.) 2 + 14 = 17
// b.) 3 * 9 = 27
// c.) 32 / 5 = 6.4
// d.) 24 – 11 = 13
// e.) 2 * 6 + 7 - 1 = 12 + 7 - 1 = 19 - 1 = 18

// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
	reg [4:0] a;
	reg [4:0] b;
	reg [3:0] c;
	reg [4:0] d;
// ------------------------- parte principal
initial begin
	$display("Exercicio0001 - Guia02 - Ana Cristina - 427385");
	$display("Test number system");
	
	a = (2+14);
	b = (3*9);
	c = (32/5);
	d = ((2*6)+7-1);
	
	$display("a = %d = %5b", a, a);
	$display("b = %d = %5b", b, b);
	$display("c = %d = %4b", c, c);
	$display("d = %d = %5b", d, d);
	end
endmodule // test_base