// ------------------------- 
// Exemplo0018 - BASE 
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 

module Q03a (output [6:0]s, input [6:0]a);
	assign s = ~a + 1;
endmodule

module Q03b (output [5:0]s, input [5:0]a);
	assign s = ~a + 1;
endmodule

module Q03c (output [5:0]s, input [5:0]a);
	assign s = ~a + 1;
endmodule

module Q03d (output [6:0]s, input [6:0]a);
	assign s = ~a + 1;
endmodule
	
module Q03e (output [5:0]s, input [4:0]a, input [5:0]b);
	assign s = ~(a - b) + 1;
endmodule

module test_base_01; 
// ------------------------- definir dados 
	reg [6:0] a;
	reg [5:0] b;
	reg [5:0] c;
	reg [6:0] d;
	reg [4:0] e; 
	reg [5:0] f;    
		
	wire [6:0] sA;
	wire [5:0] sB;
	wire [5:0] sC;
	wire [6:0] sD;
	wire [5:0] sE;  
	
	Q03a letraA(sA, a); 
	Q03b letraB(sB, b);
	Q03c letraC(sC, c);
	Q03d letraD(sD, d);
	Q03e letraE(sE, e, f);
	
initial begin: start
	a = 6'b100111; 
	b = 'o23;
	c = 23;
	d = 'h2B;
	e = 26;
	f = 36;
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
	$display("%7o = %b", b, sB);
			
	#1				
	$display("\nLetra C)");
	$display("%7d = %b", c, sC);
	
	#1
	$display("\nLetra D)");
	$display("%7h = %b", d, sD);
	
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
    0100111 = 1011001
    
    Letra B)
         23 = 101101
    
    Letra C)
         23 = 101001
    
    Letra D)
         2b = 1010101
    
    Letra E)
    26 - 36 = 001010
*/