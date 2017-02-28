// ------------------------- 
// Exemplo0026 - BASE 
// Nome: Guilherme Andrade Salum Terra 
// Matricula: 427407 
// ------------------------- 

// ------------------------- 
// test number system 
// ------------------------- 

	module test_base_01; 
// ------------------------- definir dados 
	reg [4:0] a; 
	reg [4:0] b; 
	reg [3:0] c; 
	reg [2:0] d; 
	reg [6:0] e; 

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0026 - Guilherme Terra - 427407"); 
		$display("Test number system"); 
		
		a = ~6'b100111; 
		b = ~6'o54; 
		c = ~4'd13; 
		d = ~5'h1B;
		e = 5'd25 + (~6'd36);
		
		$display("\nResultado em binario"); 
		$display("a = %d = %6b", a, a); 
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
	a = 24 =  11000
	b = 19 = 10011
	c =  2 = 0010
	d = 4 =  100
	e = 116 = 1110100
*/