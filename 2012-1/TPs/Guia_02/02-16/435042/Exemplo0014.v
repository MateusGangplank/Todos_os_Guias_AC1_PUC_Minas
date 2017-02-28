// -------------------------
// Exemplo0014 - BASE
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Alterações feitas:
// Acrescentei linhas que tratam de expressões aritméticas.
// Previsão:
// A saída serão os resultados das expressões levando em conta apenas
// os dígitos menos significativos (mais à direita do número).
// Teste 1:
// Entradas: a = 5 + 3, b = 5 + 3 e c = 10 - 5 + 25 + 3 + 1 (após as entradas do Exemplo0013).
// Observações da saída:
// A saída (além do que foi visto no Exemplo0013) são os
// valores de a, b e c em decimal e binário e demonstra
// o que ocorre quando o valor excede o número de bits
// que um registrador consegue guardar (overflow).
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
		$display("Exemplo0014 - Daniel Telles McGinnis - 435042");
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

		a = 5 + 3;
		b = 5 + 3;
		c = 10 - 5 + 25 + 3 + 1;

		$display("\nOverflow");
		$display("a = %d = %3b", a, a);
		$display("b = %d = %4b", b, b);
		$display("c = %d = %5b", c, c);
	end
endmodule // test_base