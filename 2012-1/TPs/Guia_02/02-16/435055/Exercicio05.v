// ------------------------- 
// Exercicio05
// Nome: Samuel Eusébio da Silva
// Matricula: 435055
// ------------------------- 

	module test_exercicio05; 
	// ------------------------- definir dados 
	reg [7:0] a; 
	reg [7:0] b; 
	reg [7:0] c; 
	reg [7:0] d;
	reg [7:0] e;
	// ------------------------- parte principal 
	initial begin 
	$display("Exercicio05 - Samuel Eusébio da Silva - 435055"); 
	$display("Test");
	a = 6'b101010 - 4'b1101;
	b = 5'b11010 - 4'o15;
	c = 5'o34 - 4'hB;
	d = 8'hCA - 8'b10111001;
	e = 25 - 5'h1A;
	
	$display("a = %d = %8b", a, a);
	$display("b = %d = %8b", b, b);
	$display("c = %d = %8b", c, c);
	$display("d = %d = %8b", d, d);
	$display("e = %d = %8b", e, e, " Overflow!");
	end 
	endmodule // test_exercicio05