//Exercicio 03
//Nome: Vitor Angelo Lima
//Matricula: 451621



module exercicio;
	reg [6:0] a;
	reg [6:0] a2;
	reg [5:0] b;
	reg [5:0] b2;
	reg [5:0] c;
	reg [5:0] c2;
	reg [6:0] d;
	reg [6:0] d2;
	reg [6:0] e;
	reg [6:0] e2;
	
	initial begin
		a = 6'b101010;
		a2 = ~a + 1;
		b = 5'o24;
		b2 = ~b + 1;
		c = 5'd25;
		c2 = ~c + 1;
		d = 6'h2D;
		d2 = ~d + 1;
		e = 27 - 37;
		e2 = ~e + 1;
		$display("a = %b = %b",  a, a2);
		$display("b = %b = %b",  b, b2);
		$display("c = %b = %b",  c, c2);
		$display("d = %b = %b",  d, d2);
		$display("e = %b = %b",  e, e2);
	end
endmodule
