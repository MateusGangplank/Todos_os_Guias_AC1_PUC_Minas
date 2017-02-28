// Exercicio0002 - BASE 
// Nome: Julio Machado 
// Matricula: 435666 
// -------------------------

module exercicio_2;
	reg[6:0]a;
	reg[5:0]b;
	reg[4:0]c;
	reg[9:0]d;
	reg[10:0]e;

initial begin
	$display("Exercicio02 - Julio Machado - 435666");
	
	a = 6'b101010 + 5'b11010;
	b = 5'b11010 + 5'o25;
	c = 10'o1234 / 6'h2B;
	d = 9'h1CA - 9'b101110001;
	e = 10'o1015 + 7'h7A;
	
	$display("a) a = %b", a);
	$display("b) b = %b", b);
	$display("c) c = %b", c);
	$display("d) d = %b", d);
	$display("e) e = %b", e);
end
endmodule // exercicio_02
