// ------------------------- 
// Exercicio01
// Nome: Samuel Eusébio da Silva
// Matricula: 435055
// ------------------------- 

	module test_exercicio01; 
	// ------------------------- definir dados 
	reg [4:0] a; 
	reg [4:0] b; 
	reg [3:0] c; 
	reg [3:0] d;
	reg [3:0] e;
	// ------------------------- parte principal 
	initial begin 
	$display("Exercicio01 - Samuel Eusébio da Silva - 435055"); 
	$display("Test");
	a = 2 + 15;
	b = 3 * 8;
	c = 32 / 3;
	d = 21 - 11;
	e = 2 * 5 + 6 - 1;
	
	$display("a = %d = %5b", a, a);
	$display("b = %d = %5b", b, b);
	$display("c = %d = %4b", c, c);
	$display("d = %d = %4b", d, d);
	$display("e = %d = %4b", e, e);
	end 
	endmodule // test_exercicio01