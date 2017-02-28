//Exercicio 04
//Nome: Vitor Angelo Lima
//Matricula: 451621

module exercicio;
	reg [7:0] a;
	reg [7:0] a2;
	reg [6:0] b;
	reg [6:0] b2;
	reg [5:0] c;
	reg [5:0] c2;
	reg [4:0] d;
	reg [4:0] d2;
	reg [7:0] e;
	reg [7:0] e2;
	
	initial begin
		a = 6'b101011;
		a2 = ~a + 1;
		b = 6'b111001; // 321(4)
		b2 = ~b + 1;
		c = 5'd27;
		c2 = ~c + 1;
		d = 4'hC;
		d2 = ~d + 1;
		e = 5'o21;
		e2 = ~e + 1;
		$display("a = %b = %b",  a, a2);
		$display("b = %b = %b",  b, b2);
		$display("c = %b = %b",  c, c2);
		$display("d = %b = %b",  d, d2);
		$display("e = %b = %b",  e, e2);
	end
endmodule
