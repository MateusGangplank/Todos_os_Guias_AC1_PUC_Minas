// Exercicio0002 - BASE 
// Nome: Roger Rubens Machado 
// Matricula: 430533 
// -------------------------

module exercicio_2;
	reg[6:0]a;
	reg[5:0]b;
	reg[10:0]c;
	reg[9:0]d;
	reg[10:0]e;

initial begin
	$display("Exercicio02 - Roger Rubens Machado - 430533");
	
	a = 6'b101010 + 5'b11011;
	b = 5'b11011 + 5'o25;
	c = 10'o1234 / 6'h3C;
	d = 9'h1BA - 9'b101110001;
	e = 10'o1440 + 7'h7A;
	
	$display("a) a = %b", a);
	$display("b) b = %b", b);
	$display("c) c = %b", c);
	$display("d) d = %b", d);
	$display("e) e = %b", e);
end
endmodule // exercicio_02
