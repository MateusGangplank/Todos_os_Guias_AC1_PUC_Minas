// -------------------------
// Exemplo0013 - BASE
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Alterações feitas:
// Acrescentei linhas que tratam de expressões com complemento de 1.
// Previsão:
// A saída será o complemento de 1 de 5, somado com 1.
// Teste 1:
// Entradas: a = ~5+1, b = ~5+1 e c = ~5+1 (após as entradas do Exemplo0012).
// Observações da saída:
// A saída (além do que foi visto no Exemplo0012) são os
// valores de a, b e c em decimal e binário e demonstram
// o operador ~, que é a obtenção do complemento de 1.
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
		$display("Exemplo0013 - Daniel Telles McGinnis - 435042");
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

		a = ~5+1;
		b = ~5+1;
		c = ~5+1;

		$display("\nNegative mixed expression");
		$display("a = %d = %3b", a, a);
		$display("b = %d = %4b", b, b);
		$display("c = %d = %5b", c, c);
	end
endmodule // test_base