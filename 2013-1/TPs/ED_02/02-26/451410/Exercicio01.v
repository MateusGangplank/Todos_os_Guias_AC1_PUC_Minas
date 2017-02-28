// -------------------------
// Exercicio01
// Nome: Mateus Lima Batista
// Matricula: 451410
// -------------------------
// -------------------------

module definir;

	reg[0:4] a;
	reg[0:4] b;
	reg[0:2] c;
	reg[0:4] d;
	reg[0:4] e;

initial begin: main

	$display("Exercicio01 - Mateus Lima Batista - 451410");

	a = 3 + 14;
	b = 3 * 8;
	c = 33 / 5;
	d = 25 - 11;
	e = 2 * 8 + 7 - 1;

	$display("a = %d = %5b",a,a);
	$display("b = %d = %5b",b,b);
	$display("c = %d = %3b",c,c);
	$display("d = %d = %5b",d,d);
	$display("e = %d = %5b",e,e);
end
endmodule
