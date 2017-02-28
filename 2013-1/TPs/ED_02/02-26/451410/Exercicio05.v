// Nome: Mateus Lima Batista
// Matricula: 451410
// -------------------------
// -------------------------

module exercicio;

	reg [0:7] a;
	reg [0:7] b;
	reg [0:7] c;
	reg [0:7] d;
	reg [0:7] e;

initial begin: main

	a = -('b101011 - 'b1001);
	b = -('b10011 - 'o15);
	c = -('o35 - 'hC);
	d = -('hBA - 'b10111001);
	e = -(37 - 'h1B);

	$display("Mateus Lima Batista - 451410");
	$display(" a = %8b",a);
	$display(" b = %8b",b);
	$display(" c = %8b",c);
	$display(" d = %8b",d);
	$display(" e = %8b",e);

end
endmodule
