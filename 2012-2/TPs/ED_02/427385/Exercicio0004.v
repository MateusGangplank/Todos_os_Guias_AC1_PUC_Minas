// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exercicio0004
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// 04.) Calcular e mostrar o complemento de 2
// de cada um dos valores abaixo armazenados em registrador(es):
// a.) 101011(2) com 8 bits de comprimento
// b.) 321(4) com 7 bits de comprimento
// c.) 27(10) com 6 bits de comprimento
// d.) C(16) com 5 bits de comprimento
// e.) 21(8) com 8 bits de comprimento

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
	$display("Exercicio0004 - Guia02 - Ana Cristina - 427385");
	$display("Test number system");
	
	a =  ~(101011) + 1;
	b =  ~(111001) + 1;
	c =  ~(011011) + 1;
	d =  ~(1100) + 1;
	e =  ~(010001) + 1;
	
	$display("a = %d = %8b", a, a);
	$display("b = %d = %7b", b, b);
	$display("c = %d = %6b", c, c);
	$display("d = %d = %5b", d, d);
	$display("e = %d = %8b", e, e);
	end
endmodule // test_base
