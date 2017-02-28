// Exercicio0003 - BASE 
// Nome: Roger Rubens Machado 
// Matricula: 430533 
// -------------------------

module exercicio_03;
	reg[6:0]a;
	reg[5:0]b;
	reg[5:0]c;
	reg[6:0]d;
	reg[6:0]e;

initial begin
	$display("Exercicio03 - Roger Rubens Machado - 430533");
	
	a = -6'b100111;
	b = -5'o23;
	c = -5'd23;
	d = -6'h2B;
	e = 26 - 36;
	
	$display("a) a = %b", a);
	$display("b) b = %b", b);
	$display("c) c = %b", c);
	$display("d) d = %b", d);
	$display("e) e = %b", e);
end
endmodule // exercicio_03