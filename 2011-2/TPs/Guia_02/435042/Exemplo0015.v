// -------------------------
// Exemplo0015 - BASE
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Alterações feitas:
// Acrescentei linhas que tratam de expressões aritméticas.
// Previsão:
// A saída serão os resultados das expressões nos '$display's,
// demonstrando as diversas formas de expressar os números 0,
// 1 e 2,  tanto em decimal quanto em binário.
// Teste 1:
// Entradas: <nenhuma> (após as entradas do Exemplo0014).
// Observações da saída:
// A saída (além do que foi visto no Exemplo0014) são os
// valores 0, 1 e 2 em decimal, e depois, para minha surpresa,
// valores aparentemente sem conexão com as expressões Verilog.
// Suponho que isso ocorre devido ao número de bits. Por exemplo,
// 3-1 é 2 (10), mas exibe-se 010, suponho que seja porque
// precisa-se de um bit extra para o sinal. Tenho dúvidas
// quanto à saída desse exemplo, eu as registrei em duvidas.txt.
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
		$display("Exemplo0015 - Daniel Telles McGinnis - 435042");
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

		$display("\nComplements");
		$display("0= %d = %3b = %3b", ~1 , (1-1), ~1 );
		$display("1= %d = %3b = %3b", ~0 , (2-1), ~0 );
		$display("2= %d = %3b = %3b", (1+1), (3-1), ~0+~0);
		$display("2= %d = %3b = %3b = %d", (1+1), (3-1), ~0+~0, ~1'b0+~1'b0);
	end
endmodule // test_base