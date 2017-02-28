// ------------------------- 
// Exemplo0019 - BASE 
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 

module Q04a (output [7:0]s, input [7:0]a);
	assign s = ~a + 1;
endmodule

module Q04b (output [6:0]s, input [6:0]a);
	assign s = ~a + 1;
endmodule

module Q04c (output [5:0]s, input [5:0]a);
	assign s = ~a + 1;
endmodule

module Q04d (output [4:0]s, input [4:0]a);
	assign s = ~a + 1;
endmodule
	
module Q04e (output [7:0]s, input [7:0]a);
	assign s = ~a + 1;
endmodule

module test_base_01; 
// ------------------------- definir dados 
	reg [7:0] a;
	reg [6:0] b;
	reg [5:0] c;
	reg [4:0] d;
	reg [7:0] e;    
		
	wire [7:0] sA;
	wire [6:0] sB;
	wire [5:0] sC;
	wire [4:0] sD;
	wire [7:0] sE;  
	
	Q04a letraA(sA, a); 
	Q04b letraB(sB, b);
	Q04c letraC(sC, c);
	Q04d letraD(sD, d);
	Q04e letraE(sE, e);
	
initial begin: start
	a = 6'b101011; 
	b = 57;
	c = 27;
	d = 'hC;
	e = 'o21;
end
	
// ------------------------- parte principal 
initial begin
	$display("Exemplo0019 - Oswaldo Oliveira Paulino - 382175"); 
	$display("Test number system"); 
	 
	#1 
	$display("\nLetra A)");
	$display("%b = %b", a, sA);
	
	#1
	$display("\nLetra B)");
	$display("%d = %b", b, sB);
			
	#1				
	$display("\nLetra C)");
	$display("%d = %b", c, sC);
	
	#1
	$display("\nLetra D)");
	$display("%h = %b", d, sD);
	
	#1				
	$display("\nLetra E)");
	$display("%b = %b", e, sE);	

end 
endmodule // test_base 

// ------------------------ documentacao complementar
/*
    Exemplo0019 - Oswaldo Oliveira Paulino - 382175
    Test number system
    
    Letra A)
    00101011 = 11010101
    
    Letra B)
     57 = 1000111
    
    Letra C)
    27 = 100101
    
    Letra D)
    0c = 10100
    
    Letra E)
    00010001 = 11101111
*/