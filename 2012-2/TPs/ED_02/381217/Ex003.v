//-----
//Exercicio 03
//Nome: Andre Campolina
//Matricula: 381217
//-----

//-----
//complementos de 2
//-----

module complemento_dois;

reg[5:0] a;
reg[5:0] b;
reg[4:0] c;
reg[7:0] d;
reg[3:0] e;

initial begin
	
	a = ~6'b100110 + 1;
	b = ~6'o24 + 1;
	c = ~25 + 1;
	d = ~8'h2D + 1;
	e = ~(27-37) + 1;
	
	$display("a = %d = %7b", a, a);
	$display("b = %d = %6b", b, b);
	$display("c = %d = %4b", c, c);
	$display("d = %d = %10b", d, d);
	$display("e = %d = %10b", e, e);
	
end

endmodule