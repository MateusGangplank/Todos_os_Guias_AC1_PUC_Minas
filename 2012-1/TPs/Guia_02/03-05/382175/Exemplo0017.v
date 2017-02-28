// ------------------------- 
// Exemplo0017 - BASE 
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 

module Q02a (output [6:0]s, input [5:0]a, input [4:0]b);
	assign s = a + b;
endmodule

module Q02b (output [5:0]s, input [4:0]a, input [4:0]b);
	assign s = a + b;
endmodule
	
module Q02c (output [10:0]s, input [10:0]a, input [7:0]b);
	assign s = a / b;
endmodule
	
module Q02d (output [8:0]s, input [8:0]a, input [8:0]b);
	assign s = a - b;
endmodule
	
module Q02e (output [9:0]s, input [4:0]a, input [4:0]b, input [6:0]c);
	assign s = ((a * b) + c);
endmodule

module test_base_01; 
// ------------------------- definir dados 
	reg [5:0]a; 
	reg [4:0]b; 
	reg [4:0]c; 
	reg [4:0]d;
	reg [10:0]e; 
	reg [7:0]f; 
	reg [8:0]g; 
	reg [8:0]h; 
	reg [4:0]i; 
	reg [4:0]j; 
	reg [6:0]k;   
		
	wire [6:0]sA; 
	wire [5:0]sB; 
	wire [10:0]sC; 
	wire [8:0]sD; 
	wire [9:0]sE;  
	
	Q02a letraA(sA, a, b); 
	Q02b letraB(sB, c, d);
	Q02c letraC(sC, e, f);
	Q02d letraD(sD, g, h);
	Q02e letraE(sE, i, j, k);
	
// ------------------------- parte principal 
initial begin 
	$display("Exemplo0017 - Oswaldo Oliveira Paulino - 382175"); 
	$display("Test number system"); 
	
	a = 7'b101010;
	b = 5'b11010; 
	$display("\nLetra A)");
	$display("%b + %b = %b", a, b, sA);
	
	c = 5'b11010;
	d = 'o25;
	$display("\nLetra B)");
	$display("%b + %o = %b", c, d, sB);
				
	e = 'o1234;
	f = 'h2B;
	$display("\nLetra C)");
	$display("%o / %h = %b", e, f, sC);
				
	g = 'h1CA;
	h = 9'b101110001;
	$display("\nLetra D)");
	$display("%h - %b = %b", g, h, sD);
				
	i = 25;
	j = 'o31;
	k = 'h7A;
	$display("\nLetra E)");
	$display("(%d * %o) + %h = %b", i, j, k, sE);	

end 
endmodule // test_base 

// ------------------------ documentacao complementar
/*
    Exemplo0017 - Oswaldo Oliveira Paulino - 382175
    Test number system
    
    Letra A)
    101010 + 11010 = 1000100
    
    Letra B)
    11010 + 25 = 101111
    
    Letra C)
    1234 / 2b = 00000001111
    
    Letra D)
    1ca - 101110001 = 001011001
    
    Letra E)
    (25 * 31) + 7a = 1011101011
*/