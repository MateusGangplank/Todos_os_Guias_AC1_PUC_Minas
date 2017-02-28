// -------------------------
// Exercicio 04
// Nome: Victor Raphael Machado de Amorim
// Matricula: 420147
// -------------------------

module exercicio_04;
// ------------------------- definir dados
	reg [7:0] a;
	reg [6:0] b;
	reg [5:0] c;
	reg [4:0] d;
	reg [7:0] e;
// ------------------------- parte principal
 initial begin
 	$display("Exercicio 04 - Victor Raphael Machado de Amorim - 420147");
 	$display("Operacoes");
	
	a = ~(8'b101111) + (1'b1);
	b = ~(7'b111001) + (1'b1);
	c = ~(25) + (1'b1);
	d = ~(5'hd) + (1'b1);
	e = ~(8'o24)+ (1'b1);
	
	$display("a = %d = %3b", a, a);
	$display("b = %d = %3b", b, b);
	$display("c = %d = %3b", c, c);
	$display("d = %d = %3b", d, d);
	$display("e = %d = %3b", e, e);
 end

endmodule