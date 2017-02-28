// -------------------------
// Exemplo0011 - BASE
// Nome: Daniel Telles McGinnis
// Matricula: 435042
// -------------------------
// Observa��es da sa�da:
// A sa�da s�o os valores de a, b e c. Os valores s�o exibidos
// em decimal, bin�rio, octal e hexadecimal. Note que os tr�s
// primeiros '$display's exibem o valor de a mas d�o a entender
// que est�o exibindo o valor de a, b e c.
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
		$display("Exemplo0011 - Daniel Telles McGinnis - 435042");
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
	end
endmodule // test_base