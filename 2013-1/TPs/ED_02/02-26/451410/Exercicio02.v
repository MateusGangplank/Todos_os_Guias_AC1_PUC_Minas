// -------------------------
// Exercicio02
// Nome: Mateus Lima Batista
// Matricula: 451410
// -------------------------
// -------------------------
module definir;

	reg[0:6] a;
	reg[0:5] b;
	reg[0:3] c;
	reg[0:6] d;
	reg[0:9] e;

initial begin: main

	$display("Exercicio02 - Mateus Lima Batista - 451410");

	a ='b100110 + 'b11011;
	b = 'b11101 + 'o25;
	c = 'o1234 / 'h4C;
	d = 'h1BA - 'b101110011;
	e = 25 * 'o32 + 'h8A;

	$display("a = %7b",a);
	$display("b = %6b",b);
	$display("c = %4b",c);
	$display("d = %7b",d);
	$display("e = %10b",e);
end
endmodule
