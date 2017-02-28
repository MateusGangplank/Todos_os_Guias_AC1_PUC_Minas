//Exercicio 02
//Nome: Vitor Angelo Lima
//Matricula: 451621

module exercicio;
	reg [6:0] a;
	reg [5:0] b;
	reg [3:0] c;
	reg [6:0] d;
	reg [9:0] e;
	
	initial begin
		a = 6'b101010 + 5'b11011;
		b = 5'b11011 + 5'o25;
		c = 10'o1234 / 6'h3C;
		d = 9'h1BA - 9'b101110001;
		e = 5'd25 * 6'o32 + 7'h7A;
		$display("a = %d = %b",  a, a);
		$display("b = %d = %b",  b, b);
		$display("c = %d = %b",  c, c);
		$display("d = %d = %b",  d, d);
		$display("e = %d = %b",  e, e);
	end
endmodule
