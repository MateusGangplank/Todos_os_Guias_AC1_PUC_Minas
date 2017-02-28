// ------------------------- 
// Exercicio04
// Nome: Samuel Eusébio da Silva
// Matricula: 435055
// ------------------------- 

	module test_exercicio04; 
	// ------------------------- definir dados 
	reg [7:0] a; 
	reg [6:0] b; 
	reg [5:0] c; 
	reg [4:0] d;
	reg [7:0] e;
	// ------------------------- parte principal 
	initial begin 
	$display("Exercicio04 - Samuel Eusébio da Silva - 435055"); 
	$display("Test");
	a = -6'b101010;
	b = -7'b11011;
	c = -5'd23;
	d = -4'hE;
	e = -5'o26;
	
	$display("a = %d = %8b", a, a);
	$display("b = %d = %7b", b, b);
	$display("c = %d = %5b", c, c);
	$display("d = %d = %6b", d, d);
	$display("e = %d = %8b", e, e);
	end 
	endmodule // test_exercicio04