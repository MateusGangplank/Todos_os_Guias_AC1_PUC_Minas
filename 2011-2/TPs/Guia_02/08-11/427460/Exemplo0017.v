
// ------------------------- 
// Exemplo0017 - BASE 
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460

// ------------------------- 
// ------------------------- 
// test number system 

// ------------------------- 
	module test_base_01; 

// ------------------------- definir dados 
	reg [5:0] a; 
	reg [5:0] b; 
	reg [3:0] c; 
	reg [6:0] d;
	reg [9:0] e;

// ------------------------- parte principal 
	initial begin 
	
		$display("Exemplo0017 - Rodrigo Arruda de Assis - 427460"); 
		$display("Test number system"); 
	
	a = 6'b100010 + 5'b11010; 
	b = 5'b11010 + 6'o23; 
	c = 12'o1234 / 8'h2D; 
	d = 12'h1A9 - 9'b101101001; 
	e = 5'd25 * 6'o41 + 8'h6B; 


	
		$display("a = %d = %6b", a,a); 		
		$display("b = %d = %6b", b,b); 
		$display("c = %d = %4b", c,c);	
		$display("d = %d = %6b", d,d) ; 
		$display("c = %d = %7b", e,e);
	end
 
endmodule // test_base 

//------------

//Exemplo0017 - Rodrigo Arruda de Assis - 427460
//   Test number system
   
//a = 60 = 111100
//b = 45 = 101101
//c = 14 = 1110
//d =  64 = 1000000
//c =  932 = 1110100100

//------------