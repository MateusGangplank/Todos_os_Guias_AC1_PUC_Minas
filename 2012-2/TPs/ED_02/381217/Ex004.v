//-----
//Exercicio 04
//Nome: Andre Campolina
//Matricula: 381217
//-----

//-----
//complementos de 2 com tamanhos fixos de bits
//-----

module complementos_tamanho;

reg[7:0] a;
reg[6:0] b;
reg[5:0] c;
reg[4:0] d;
reg[7:0] e;

initial begin
	
	a = ~6'b101011 + 1;
	b = ~6'b111001 + 1;
	c = ~27 + 1;
	d = ~4'hC + 1;
	e = ~6'o21 + 1;
	
	$display("a = %d = %7b", a, a);
	$display("b = %d = %6b", b, b);
	$display("c = %d = %4b", c, c);
	$display("d = %d = %10b", d, d);
	$display("e = %d = %10b", e, e);
	
end

endmodule