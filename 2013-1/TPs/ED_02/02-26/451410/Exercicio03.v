// Exercicio03
// Nome: Mateus Lima Batista
// Matricula: 451410
// -------------------------
// -------------------------

module exercicio03;

//definir dados

	reg [0:4] a;
	reg [0:3] b;
	reg [0:2] c;
	reg [0:4] d;
	reg [0:6] e;
	
initial begin: main

	a = -'b101010;
	b = -'o25;
	c = -'d27;
	d = -'h2C;
	e = 25 - 35;

	$display("Mateus Lima Batista - 451410");
	$display(" a = %b",a);
	$display(" b = %b",b);
	$display(" c = %b",c);
	$display(" d = %b",d);
	$display(" e = %b",e);

end
endmodule
		


