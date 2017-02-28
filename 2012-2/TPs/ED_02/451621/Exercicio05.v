//Exercicio 05
//Nome: Vitor Angelo Lima
//Matricula: 451621

module exercicio;
	reg [7:0] a;
	reg [7:0] b;
	reg [7:0] c;
	reg [7:0] d;
	reg [7:0] e;
	
	initial begin
		a = 8'b101010 + ~(8'b1001) + 1;
		b = 8'b11011 + ~(8'o15) + 1;
		c = 8'o34 + ~(8'hC) + 1;
		d = 8'hDA + ~(8'b10111001) + 1;
		e = 8'd27 + ~(8'h1B)  + 1;
		$display( "a = %b", a);
		$display("b = %b",  b);
		$display("c = %b",  c);
		$display("d = %b",  d);
		$display("e = %b",  e);
	end
endmodule
