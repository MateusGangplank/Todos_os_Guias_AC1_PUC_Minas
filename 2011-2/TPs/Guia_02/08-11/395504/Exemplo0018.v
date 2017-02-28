// ------------------------- 
// Exemplo0018 - BASE 
// Nome: Thaise Souto Martins 
// Matricula: 395504
// ------------------------- 

// ------------------------- 
// test number system 
// ------------------------- 

	module test_base_01; 
// ------------------------- definir dados 
	reg [4:0] a; 
	reg [4:0] b; 
	reg [9:0] c; 
	reg [2:0] d; 
	reg [9:0] e; 

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0018 - Thaise Souto Martins - 395504"); 
		$display("Test number system"); 
		
		a = ~6'b100111 + 1'b1; 
		b = ~6'o54 + 1; 
		c = (~4'd13) + 1; 
		d = ~5'h1B + 1;
		e = 5'd25 + ((~6'd36) + 1);
		
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
 	a = 60 = 111100
	b = 45 = 101101
	c =  713 = 1011001001
	d =  64 = 1000000
	e =  800 = 1100100000
*/