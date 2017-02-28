// -------------------------
// Exercicio 05
// Nome: Victor Raphael Machado de Amorim
// Matricula: 420147
// -------------------------

module exercicio_05;
// ------------------------- definir dados
	reg [7:0] a;
	reg [7:0] b;
	reg [7:0] c;
	reg [7:0] d;
	reg [7:0] e;
// ------------------------- parte principal
 initial begin
 	$display("Exercicio 05 - Victor Raphael Machado de Amorim - 420147");
 	$display("Operacoes");
	
	a = ((8'b101011) + (~(8'b1001) + (1'b1)));
	b = (8'b10011) + (~(8'o15)+(1'b1));
	c = (8'o35) + (~(8'hc)+(1'b1));
	d = (8'hba) + (~(8'b10111001)+(1'b1));
	e = (37)+ (~(8'h1b)+(1'b1));
	
	$display("a = %d = %3b", a, a);
	$display("b = %d = %3b", b, b);
	$display("c = %d = %3b", c, c);
	$display("d = %d = %3b", d, d);
	$display("e = %d = %3b", e, e);
 end

endmodule