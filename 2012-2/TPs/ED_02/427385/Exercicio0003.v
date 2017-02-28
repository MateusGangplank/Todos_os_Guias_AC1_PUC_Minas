// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exercicio0003
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// 03.) Calcular e mostrar o complemento de 2
// de cada um dos valores abaixo armazenados em registrador(es):
// a.) 100110(2) = C1(011001) + 1 = 101000(2)
// b.) 24(8) = 20(10) = 10100(2) = C1(01011) + 1 = 01100(2)
// c.) 25(10) = 11001(2) = C1(00110) + 1 = 00111(2)
// d.) 2D(16) = 45(10) = 101101(2) = C1(010010) + 1 = 010001(2)
// e.) 27 - 37 = -10(10) = 10110(2) = C1(01001) + 1 = 01010(2)

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
	$display("Exercicio0003 - Guia02 - Ana Cristina - 427385");
	$display("Test number system");
	
	a = ~(6'b100110) + 1;
	b = ~(5'o24) + 1;
	c = ~(25) + 1;
	d = ~(6'b101101) + 1;
	e = ~(-10) + 1;
	
	$display("a = %d = %6b", a, a);
	$display("b = %d = %6b", b, b);
	$display("c = %d = %4b", c, c);
	$display("d = %d = %5b", d, d);
	$display("e = %d = %7b", e, e);
	end
endmodule // test_base