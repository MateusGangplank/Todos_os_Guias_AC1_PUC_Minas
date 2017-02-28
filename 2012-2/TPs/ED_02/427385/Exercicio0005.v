// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exercicio0005
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// 05.) Executar as operações abaixo,
// armazenar seus dados e resultados em registradores
// e mostrar os valores resultantes em binário,
// usar 8 bits e complemento de 2 nas subtrações:
// a.) 101010(2) – 1001(2)
// b.) 11011(2) – 15(8)
// c.) 34(8) – C(16)
// d.) DA(16) – 10111001(2)
// e.) 27 – 1B(16)

// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
	reg [7:0] a, b, c, d, e;
// ------------------------- parte principal
initial begin
	$display("Exercicio0005 - Guia02 - Ana Cristina - 427385");
	$display("Test number system");
	
	a = ~(100001) + 1;
	b = ~(1110) + 1;
	c = ~(10000) + 1;
	d = ~(100001) + 1;
	e = ~(000000) + 1;
	
	$display("a = %d = %8b", a, a);
	$display("b = %d = %8b", b, b);
	$display("c = %d = %8b", c, c);
	$display("d = %d = %8b", d, d);
	$display("e = %d = %8b", e, e);
	end
endmodule // test_base