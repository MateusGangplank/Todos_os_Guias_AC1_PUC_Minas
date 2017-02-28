// -------------------------
// Exercicio 03
// Nome: Victor Raphael Machado de Amorim
// Matricula: 420147
// -------------------------

module exercicio_03;
// ------------------------- definir dados
	reg [5:0] a;
	reg [4:0] b;
	reg [3:0] c;
	reg [5:0] d;
	reg [4:0] e;
// ------------------------- parte principal
 initial begin
 	$display("Exercicio 03 - Victor Raphael Machado de Amorim - 420147");
 	$display("Operacoes");
	
	a = ~(6'b101010) + (1'b1);
	b = ~(5'o25) + (1'b1);
	c = ~(27) + (1'b1);
	d = ~(9'h2c) + (1'b1);
	e = ~(25-35)+ (1'b1);
	
	$display("a = %d = %3b", a, a);
	$display("b = %d = %3b", b, b);
	$display("c = %d = %3b", c, c);
	$display("d = %d = %3b", d, d);
	$display("e = %d = %3b", e, e);
 end

endmodule