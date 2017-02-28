
// ------------------------- 
// Exemplo0016 - BASE 
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
	reg [3:0] c; 
	reg [3:0] d;
	reg [3:0] e;

// ------------------------- parte principal 
	initial begin 
	
		$display("Exemplo0016 - Rodrigo Arruda de Assis - 427460"); 
		$display("Test number system"); 
	
	a= 2 + 14 ;
	b= 3*7;
	c= 34/3;
	d= 19-11;
	e=2*4+6-1;
	
		$display("a = %5b", a); 		
		$display("b = %5b", b); 
		$display("c = %4b", c);	
		$display("d = %4b", d) ; 
		$display("c = %4b", e);
	end
 
endmodule // test_base 

//------------

//Exemplo0016 - Rodrigo Arruda de Assis - 427460
//   Test number system
   
// a = 10000
// b = 10101
// c = 1011
// d = 1000
// c = 1101

//------------