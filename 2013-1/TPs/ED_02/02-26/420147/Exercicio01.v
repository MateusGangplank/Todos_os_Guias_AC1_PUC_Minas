// -------------------------
// Exercicio 01
// Nome: Victor Raphael Machado de Amorim
// Matricula: 420147
// -------------------------

module exercicio_01;
// ------------------------- definir dados
	reg [4:0] a;
	reg [4:0] b;
	reg [2:0] c;
	reg [3:0] d;
	reg [4:0] e;
// ------------------------- parte principal
 initial begin
 	$display("Exercicio 01 - Victor Raphael Machado de Amorim - 420147");
 	$display("Operacoes");
	
	a = 3 + 14;
	b = 3 * 8;
	c = 33 / 5;
	d = 25 - 11;
	e = 2 * 8 + 7 - 1;
	
	$display("a = %d = %3b", a, a);
	$display("b = %d = %3b", b, b);
	$display("c = %d = %3b", c, c);
	$display("d = %d = %3b", d, d);
	$display("e = %d = %3b", e, e);
 end

endmodule // test_base