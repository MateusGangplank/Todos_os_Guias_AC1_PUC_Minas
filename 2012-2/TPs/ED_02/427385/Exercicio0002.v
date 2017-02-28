// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exercicio0002
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// 02.) Executar as operações abaixo,
// armazenar seus dados e resultados em registradores
// e mostrar os valores resultantes em binário,
// com a menor quantidade de bits necessária:
// a.) 101010(2) + 11011(2) = 42(10) + 27(10) = 1000101(2)
// b.) 11011(2) + 25(8) = 27(10) + 21(10) = 48(10) = 110000(2)
// c.) 1234(8) / 3C(16) = 668(10) / 60(10) = 11(10) = 1011(2)
// d.) 1BA(16) – 101110001(2) = 442(10) - 369(10) = 73(10) = 1001001(2)
// e.) 25 * 32(8) + 7A(16) = ( 25(10) * 26(10) ) + 122(10) = ( 650(10) ) + 122(10) = 772(10) = 1100000100(2)

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
	$display("Exercicio0002 - Guia02 - Ana Cristina - 427385");
	$display("Test number system");
	
	a = 6'b101010 + 5'b11011;
	b = 5'b11011 + 5'o25;
	c = 10'o1234 / 6'h3C;
	d = 9'h1BA - 9'b101110001;
	e = (25 * 5'o32) + 7'h7A;
	
	$display("a = %d = %7b", a, a);
	$display("b = %d = %6b", b, b);
	$display("c = %d = %4b", c, c);
	$display("d = %d = %5b", d, d);
	$display("e = %d = %7b", e, e);
	end
endmodule // test_base