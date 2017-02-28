// FAVOR REVER O ENUNCIADO (ALTERADO EM 17/08)

// ------------------------- 
// Exemplo0024 - BASE 
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
	reg [3:0] d; 
	reg [3:0] e; 

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0024 - Guilherme Terra - 427407"); 
		$display("Test number system"); 
		
		a = 2 + 14; 
		b = 3 * 7; 
		c = 34 / 3; 
		d = 19 - 11;
		e = 2 * 4 + 6 - 1;
		
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
 	a = 16 = 10000
 	b = 21 = 10101
 	c = 11 = 1011
 	d =  8 = 1000
 	e = 13 = 1101
*/