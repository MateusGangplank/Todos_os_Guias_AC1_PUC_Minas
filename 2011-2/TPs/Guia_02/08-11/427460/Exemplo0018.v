
// ------------------------- 
// Exemplo0018 - BASE 
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460

// ------------------------- 
// ------------------------- 
// test number system 

// ------------------------- 
	module test_base_01; 

// ------------------------- definir dados 
	reg [4:0] a; 
	reg [4:0] b; 
	reg [1:0] c; 
	reg [6:0] d;
	reg [3:0] e;

// ------------------------- parte principal 
	initial begin 
	
		$display("Exemplo0018 - Rodrigo Arruda de Assis - 427460"); 
		$display("Test number system"); 
	
	
	a = ~6'b100111 + 1'b1; 
	b = ~6'o54+ 1'b1; 
	c = ~13 + 1'b1; 
	d = ~8'h1B + 1'b1; 
	e = ~25 - ~36 + 1'b1 ;

	
		$display("a =  %5b", a); 		
		$display("b =  %5b", b); 
		$display("c =  %2b", c);	
		$display("d =  %5b", d) ; 
		$display("c =  %4b", e);
	end
 
endmodule // test_base 

//------------

//Exemplo0018 - Rodrigo Arruda de Assis - 427460
//   Test number system

//	a =  11001
//	b =  10100
//	c =  11
//	d =  1100101
//	c =  1100

//------------