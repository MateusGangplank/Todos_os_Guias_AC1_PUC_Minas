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
	a = 6'b101010; 
	b = 27;
	c = 6'd23;
	d = 4'hE;
	e = 6'o26;
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
	$display("%8d = %b", b, sB);
			
	#1				
	$display("\nLetra C)");
	$display("%8d = %b", c, sC);
	
	#1
	$display("\nLetra D)");
	$display("%8h = %b", d, sD);
	
	#1				
	$display("\nLetra E)");
	$display("%8b = %b", e, sE);	

end 
endmodule // test_base 

// ------------------------ documentacao complementar
/*
    Exemplo0019 - Oswaldo Oliveira Paulino - 382175
    Test number system
    
    Letra A)
    00101010 = 11010110
    
    Letra B)
          27 = 1100101
    
    Letra C)
          23 = 101001
    
    Letra D)
          0e = 10010
    
    Letra E)
    00010110 = 11101010
*/