// ------------------------- 
// Exemplo0017 - BASE 
// Nome: Guilherme Andrade Salum Terra 
// Matricula: 427407 
// ------------------------- 

// ------------------------- 
// test number system 
// ------------------------- 

	module test_base_01; 
// ------------------------- definir dados 
	reg [5:0] a; 
	reg [5:0] b; 
	reg [9:0] c; 
	reg [6:0] d; 
	reg [9:0] e; 

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0017 - Guilherme Terra - 427407"); 
		$display("Test number system"); 
		
		a = 6'b100010 + 5'b11010; 
		b = 5'b11010 + 5'o23; 
		c = 10'o1234 + 6'h2D; 
		d = 9'h1A9 - 9'b101101001;
		e = 5'o25 * 6'o41 + 7'h6B;
		
		$display("\nResultado em binario"); 
		$display("a = %d = %5b", a, a); 
		$display("b = %d = %5b", b, b); 
		$display("c = %d = %4b", c, c);
		$display("d = %d = %4b", d, d);
		$display("e = %d = %4b", e, e);
	end 

	endmodule // test_base 
	
// ------------------------- testes

/*
	Test number system

 	Resultado em binario
 	a = 60 = 111100
	b = 45 = 101101
	c =  713 = 1011001001
	d =  64 = 1000000
	e =  800 = 1100100000
*/