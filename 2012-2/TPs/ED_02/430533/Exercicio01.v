// Exercicio0001 - BASE 
// Nome: Roger Rubens Machado 
// Matricula: 430533 
// -------------------------

module exercicio_01;
	reg[4:0]a;
	reg[4:0]b;
	reg[6:0]c;
	reg[4:0]d;
	reg[3:0]e;
	
initial begin
	$display("Exercicio01 - Roger Rubens Machado - 430533");
	
	a = 2 + 14;
	b = 3 * 9;
	c = 32 / 5;
	d = 24 - 11;
	e = 2 * 6 + 7 - 1;
	$display("a) a = %b", a);
	$display("b) b = %b", b);
	$display("c) c = %b", c);
	$display("d) d = %b", d);
	$display("e) e = %b", e);
end
endmodule // exercicio_01