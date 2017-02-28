// ------------------------- 
// Exemplo0011 - BASE 
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 

module Q01a (output [4:0]s, input [1:0]a, input [4:0]b);
	assign s = a + b;
endmodule

module Q01b (output [4:0]s, input [1:0]a, input [3:0]b);
	assign s = a * b;
endmodule
	
module Q01c (output [5:0]s, input [5:0]a, input [1:0]b);
	assign s = a / b;
endmodule
	
module Q01d (output [4:0]s, input [4:0]a, input [3:0]b);
	assign s = a - b;
endmodule
	
module Q01e (output [3:0]s, input [1:0]a, input [2:0]b, input [2:0]c, input[1:0] d);
	assign s = ((a * b) + c - d);
endmodule


module test_base_01; 
// ------------------------- definir dados 
	reg [1:0] a; 
	reg [4:0] b; 
	reg [1:0] c; 
	reg [3:0] d;
	reg [5:0] e; 
	reg [1:0] f; 
	reg [4:0] g; 
	reg [3:0] h; 
	reg [1:0] i; 
	reg [2:0] j; 
	reg [2:0] k; 
	reg [1:0] l;  
		
	wire [4:0]sA; 
	wire [4:0]sB; 
	wire [5:0]sC; 
	wire [4:0]sD; 
	wire [3:0]sE; 
	
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
	b = 15;
	$display("\nLetra A)");
	$display("%b + %b = %b", a, b, sA);
	
	c = 3;
	d = 8;
	$display("\nLetra B)");
	$display("%b * %b = %b", c, d, sB);
				
	e = 32;
	f = 3;
	$display("\nLetra C)");
	$display("%b / %b = %b", e, f, sC);
				
	g = 21;
	h = 11;
	$display("\nLetra D)");
	$display("%b - %b = %b", g, h, sD);
				
	i = 2;
	j = 5;
	k = 6;
	l = 1;
	$display("\nLetra E)");
	$display("(%b * %b) + %b - %b = %5b", i, j, k, l, sE);	

end 
endmodule // test_base 

// ------------------------ documentacao complementar
/*
    Exemplo0016 - Oswaldo Oliveira Paulino - 382175
    Test number system
    
    Letra A)
    10 + 01111 = 10001
    
    Letra B)
    11 * 1000 = 11000
    
    Letra C)
    100000 / 11 = 001010
    
    Letra D)
    10101 - 1011 = 01010
    
    Letra E)
    (10 * 101) + 110 - 01 =  1111
*/