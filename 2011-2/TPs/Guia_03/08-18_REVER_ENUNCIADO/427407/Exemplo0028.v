// ------------------------- 
// Exemplo0028 - BASE 
// Nome: Guilherme Andrade Salum Terra 
// Matricula: 427407 
// ------------------------- 

// ------------------------- 
// test number system 
// ------------------------- 

	module test_base_01; 
// ------------------------- definir dados 
	reg [7:0] a; 
	reg [6:0] b; 
	reg [5:0] c; 
	reg [4:0] d; 
	reg [3:0] e; 

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0028 - Guilherme Terra - 427407"); 
		$display("Test number system"); 
		
		a = ~6'b10001 +1; 
		b = ~6'o64 +1; 
		c = ~4'd14 +1; 
		d = ~8'hC4 +1;
		e = (5'd28 + (~6'd35)) +1;
		
		$display("\nResultado em binario"); 
		$display("a = %d = %b", a, a); 
		$display("b = %d = %b", b, b); 
		$display("c = %d = %b", c, c);
		$display("d = %d = %b", d, d);
		$display("e = %d = %b", e, e);
	end 

	endmodule // test_base 
	
// ------------------------- testes

/*
	Test number system

 	Resultado em binario
	a = 239 = 11101111
	b =  76 = 1001100
	c = 50 = 110010
	d = 28 = 11100
	e =  9 = 1001
*/