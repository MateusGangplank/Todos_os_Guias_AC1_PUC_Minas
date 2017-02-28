// -------------------------
// Exemplo0012 - BASE
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Altera��es feitas:
// Acrescentei linhas que tornam a, b e c iguais a -5 e que exibem seus valores.
// Previs�o:
// A sa�da �, al�m do que foi visto no Exemplo0011, a exibi��o de 3 valores
// iguais com tamanhos diferentes.
// Teste 1:
// Entradas: a=-5, b=-5 e c=-5 (ap�s as entradas do Exemplo0011).
// Observa��es da sa�da:
// A sa�da (al�m do que foi visto no Exemplo0011) s�o os
// valores de a, b e c em decimal e bin�rio. Note que
// dependendo do n�mero de d�gitos, o valor bin�rio
// exibido (que est� em complemento de 2) tamb�m varia.
// Portanto, n�o s�o valores iguais, mas, de certa forma,
// s�o equivalentes.
// -------------------------
// test number system
// -------------------------
module test_base_01;
	// ------------------------- definir dados
	reg [2:0] a;
	reg [3:0] b;
	reg [4:0] c;
	reg [4:0] d;
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0012 - Daniel Telles McGinnis - 435042");
		$display("Test number system");
		a = 5;
		b = 10;
		c = 15;
		d = 20;
		$display("\nPositive value");
		$display("a = %d = %3b", a, a);
		$display("b = %d = %4b", a, a);
		$display("c = %d = %5b", a, a);
		$display("b = %d = %4b", b, b);
		$display("c = %d = %5b", c, c);
		$display("d = %d = %5b", d, d);
		$display("d = %d = %5o", d, d);
		$display("d = %d = %5h", d, d);

		a = -5;
		b = -5;
		c = -5;

		$display("\nNegative value");
		$display("a = -5 [3] = %d = %3b", a, a);
		$display("b = -5 [4] = %d = %4b", b, b);
		$display("c = -5 [5] = %d = %5b", c, c);
	end
endmodule // test_base