// Exercicio0005 - BASE 
// Nome: Julio Machado 
// Matricula: 435666 
// -------------------------

module exercicio_05;
	reg[7:0]a, b, c, d, e;
	
initial begin
	$display("Exercicio05 - Julio Machado - 435666");
	
	a = 4'b1011 - 4'b1101;
	b = 5'b11010 - 4'o15;
	c = 5'o34 - 8'b10111001;
	d = 8'hCA - 5'h1A;
	e = 5'd25 - 5'h1A;
	
	$display("a) a = %b", a);
	$display("b) b = %b", b);
	$display("c) c = %b", c);
	$display("d) d = %b", d);
	$display("e) e = %b", e);
end
endmodule // exercicio_05