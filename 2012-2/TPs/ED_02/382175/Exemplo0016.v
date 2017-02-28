// ------------------------- 
// Exemplo0016
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 

module Q01a (output [4:0]s, input [1:0]a, input [3:0]b);
	assign s = a + b;
endmodule

module Q01b (output [4:0]s, input [1:0]a, input [3:0]b);
	assign s = a * b;
endmodule
	
module Q01c (output [5:0]s, input [5:0]a, input [2:0]b);
	assign s = a / b;
endmodule
	
module Q01d (output [4:0]s, input [4:0]a, input [3:0]b);
	assign s = a - b;
endmodule
	
module Q01e (output [4:0]s, input [1:0]a, input [2:0]b, input [2:0]c, input d);
	assign s = ((a * b) + c - d);
endmodule


module test_base_01; 
// ------------------------- definir dados 
	reg [1:0] a; 
	reg [3:0] b; 
	reg [1:0] c; 
	reg [3:0] d;
	reg [5:0] e; 
	reg [2:0] f; 
	reg [4:0] g; 
	reg [3:0] h; 
	reg [1:0] i; 
	reg [2:0] j; 
	reg [2:0] k; 
	reg       l;  
		
	wire [4:0]sA; 
	wire [4:0]sB; 
	wire [5:0]sC; 
	wire [4:0]sD; 
	wire [4:0]sE; 
	
	Q01a letraA(sA, a, b); 
	Q01b letraB(sB, c, d);
	Q01c letraC(sC, e, f);
	Q01d letraD(sD, g, h);
	Q01e letraE(sE, i, j, k, l);
	
// ------------------------- parte principal 
initial begin 
	$display("Exemplo0016 - Oswaldo Oliveira Paulino - 382175"); 
	$display("Test number system"); 
	
	a = 2;
	b = 14;
	$display("\nLetra A)");
	$display("%b + %b = %b", a, b, sA);
	
	c = 3;
	d = 9;
	$display("\nLetra B)");
	$display("%b * %b = %b", c, d, sB);
				
	e = 32;
	f = 5;
	$display("\nLetra C)");
	$display("%b / %b = %b", e, f, sC);
				
	g = 24;
	h = 11;
	$display("\nLetra D)");
	$display("%b - %b = %b", g, h, sD);
				
	i = 2;
	j = 6;
	k = 7;
	l = 1;
	$display("\nLetra E)");
	$display("(%b * %b) + %b - %b = %b", i, j, k, l, sE);	

end 
endmodule // test_base 

// ------------------------ documentacao complementar
/*
    Exemplo0016 - Oswaldo Oliveira Paulino - 382175
    Test number system
    
    Letra A)
    10 + 1110 = 10000
    
    Letra B)
    11 * 1001 = 11011
    
    Letra C)
    100000 / 101 = 000110
    
    Letra D)
    11000 - 1011 = 01101
    
    Letra E)
    (10 * 110) + 111 - 1 = 10010
*/