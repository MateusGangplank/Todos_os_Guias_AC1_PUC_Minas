// Exercicio0004 - BASE 
// Nome: Roger Rubens Machado 
// Matricula: 430533 
// -------------------------

module exercicio_04;
	reg[7:0]a;
	reg[6:0]b;
	reg[5:0]c;
	reg[4:0]d;
	reg[7:0]e;

initial begin
	$display("Exercicio04 - Roger Rubens Machado - 430533");
	
	a = -6'b101010;
	b = -5'b11011;
	c = -5'd23;
	d = -6'hE;
	e = -5'o26;
	
	$display("a) a = %b", a);
	$display("b) b = %b", b);
	$display("c) c = %b", c);
	$display("d) d = %b", d);
	$display("e) e = %b", e);
end
endmodule // exercicio_04