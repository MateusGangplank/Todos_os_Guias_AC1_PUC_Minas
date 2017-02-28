// ------------------------- 
// Exercicio02
// Nome: Samuel Eusébio da Silva
// Matricula: 435055
// ------------------------- 

	module test_exercicio02; 
	// ------------------------- definir dados 
	reg [6:0] a; 
	reg [5:0] b; 
	reg [3:0] c; 
	reg [6:0] d;
	reg [7:0] e;
	// ------------------------- parte principal 
	initial begin 
	$display("Exercicio02 - Samuel Eusébio da Silva - 435055"); 
	$display("Test");
	a = 6'b101010 + 5'b11010;
	b = 5'b11010 + 5'o25;
	c = 10'o1234 / 6'h2B;
	d = 9'h1CA - 9'b101110001;
	e = 5'o25 * 5'o31 + 7'h7A;
	
	$display("a = %d = %7b", a, a);
	$display("b = %d = %6b", b, b);
	$display("c = %d = %4b", c, c);
	$display("d = %d = %7b", d, d);
	$display("e = %d = %8b", e, e);
	end 
	endmodule // test_exercicio02