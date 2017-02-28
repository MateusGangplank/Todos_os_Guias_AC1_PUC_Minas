// ------------------------- 
// Exemplo0027 - BASE 
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
		$display("Exemplo0027 - Guilherme Terra - 427407"); 
		$display("Test number system"); 
		
		a = ~6'b110101 +1; 
		b = ~6'o51 +1; 
		c = ~4'd11 +1; 
		d = ~8'hB3 +1;
		e = (5'd19 + (~6'd25)) +1;
		
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
	a = 24 =  11000
	b = 19 = 10011
	c =  2 = 0010
	d = 4 =  100
	e = 116 = 1110100
*/