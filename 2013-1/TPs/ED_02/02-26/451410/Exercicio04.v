// Nome: Mateus Lima Batista
// Matricula: 451410
// -------------------------
// -------------------------

module exercicio;

	reg [0:7] a;
	reg [0:6] b;
	reg [0:5] c;
	reg [0:4] d;
	reg [0:7] e;

initial begin: main

	a = -'b101111;
	b = -'d57;
	c = -'d25;
	d = -'hD;
	e = -'o24;

	$display("Mateus Lima Batista - 451410");
	$display(" a = %8b",a);
	$display(" b = %7b",b);
	$display(" c = %6b",c);
	$display(" d = %5b",d);
	$display(" e = %8b",e);

end
endmodule
