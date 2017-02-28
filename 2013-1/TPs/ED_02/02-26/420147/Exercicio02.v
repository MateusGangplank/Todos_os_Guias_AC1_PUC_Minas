// -------------------------
// Exercicio 02
// Nome: Victor Raphael Machado de Amorim
// Matricula: 420147
// -------------------------

module exercicio_02;
// ------------------------- definir dados
	reg [4:0] a;
	reg [4:0] b;
	reg [3:0] c;
	reg [2:0] d;
	reg [3:0] e;
// ------------------------- parte principal
 initial begin
 	$display("Exercicio 02 - Victor Raphael Machado de Amorim - 420147");
 	$display("Operacoes");
	
	a = 100110 + 11011;
	b = 29 + 21;
	c = 668 / 76;
	d = 442 - 371;
	e = 21 * 26 + 138;
	
	$display("a = %d = %3b", a, a);
	$display("b = %d = %3b", b, b);
	$display("c = %d = %3b", c, c);
	$display("d = %d = %3b", d, d);
	$display("e = %d = %3b", e, e);
 end

endmodule