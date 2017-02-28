// ------------------------- 
// Exemplo0018 
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 

module Q03a (output [5:0]s, input [5:0]a);
	assign s = ~a + 1;
endmodule

module Q03b (output [3:0]s, input [4:0]a);
	assign s = ~a + 1;
endmodule

module Q03c (output [2:0]s, input [4:0]a);
	assign s = ~a + 1;
endmodule

module Q03d (output [4:0]s, input [5:0]a);
	assign s = ~a + 1;
endmodule
	
module Q03e (output [3:0]s, input [4:0]a, input [5:0]b);
	assign s = ~(a - b) + 1;
endmodule

module test_base_01; 
// ------------------------- definir dados 
	reg [5:0] a;
	reg [4:0] b;
	reg [4:0] c;
	reg [5:0] d;
	reg [4:0] e; 
	reg [5:0] f;    
		
	wire [5:0] sA;
	wire [3:0] sB;
	wire [2:0] sC;
	wire [4:0] sD;
	wire [3:0] sE;  
	
	Q03a letraA(sA, a); 
	Q03b letraB(sB, b);
	Q03c letraC(sC, c);
	Q03d letraD(sD, d);
	Q03e letraE(sE, e, f);
	
initial begin: start
	a = 6'b100110; 
	b = 'o24;
	c = 25;
	d = 'h2D;
	e = 27;
	f = 37;
end	
	
// ------------------------- parte principal 
initial begin
	$display("Exemplo0018 - Oswaldo Oliveira Paulino - 382175"); 
	$display("Test number system"); 
	 
	#1 
	$display("\nLetra A)");
	$display("%b = %b", a, sA);
	
	#1
	$display("\nLetra B)");
	$display("%o = %b", b, sB);
			
	#1				
	$display("\nLetra C)");
	$display("%d = %b", c, sC);
	
	#1
	$display("\nLetra D)");
	$display("%h = %b", d, sD);
	
	#1				
	$display("\nLetra E)");
	$display("%d - %d = %b", e, f, sE);	

end 
endmodule // test_base 

// ------------------------ documentacao complementar
/*
    Exemplo0018 - Oswaldo Oliveira Paulino - 382175
    Test number system
    
    Letra A)
    100110 = 011010
    
    Letra B)
    24 = 1100
    
    Letra C)
    25 = 111
    
    Letra D)
    2d = 10011
    
    Letra E)
    27 - 37 = 1010
*/