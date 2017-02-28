// Exercicio0005 - BASE 
// Nome: Roger Rubens Machado 
// Matricula: 430533 
// -------------------------

module exercicio_05;
	reg[7:0]a, b, c, d, e;
	
initial begin
	$display("Exercicio05 - Roger Rubens Machado - 430533");
	
	a = 4'b101010 - 4'b1001;
	b = 5'b11011 - 4'o15;
	c = 5'o34 - 5'hC;
	d = 8'hDA - 8'b10111001;
	e = 5'd27 - 5'h1B;
	
	$display("a) a = %b", a);
	$display("b) b = %b", b);
	$display("c) c = %b", c);
	$display("d) d = %b", d);
	$display("e) e = %b", e);
end
endmodule // exercicio_05