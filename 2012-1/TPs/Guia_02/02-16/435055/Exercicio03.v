// ------------------------- 
// Exercicio03
// Nome: Samuel Eusébio da Silva
// Matricula: 435055
// ------------------------- 

	module test_exercicio03; 
	// ------------------------- definir dados 
	reg [5:0] a; 
	reg [4:0] b; 
	reg [4:0] c; 
	reg [5:0] d;
	reg [3:0] e;
	// ------------------------- parte principal 
	initial begin 
	$display("Exercicio03 - Samuel Eusébio da Silva - 435055"); 
	$display("Test");
	a = -6'b100111;
	b = -5'o23;
	c = -5'd23;
	d = -6'h2B;
	e = 26 - 36;
	
	$display("a = %d = %6b", a, a);
	$display("b = %d = %5b", b, b);
	$display("c = %d = %5b", c, c);
	$display("d = %d = %6b", d, d);
	$display("e = %d = %4b", e, e);
	end 
	endmodule // test_exercicio03