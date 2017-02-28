 // ------------------------- 
// Exemplo0016 - OPERAÇÕES
// Nome: Rafael Santos Moura 
// Matricula: 441705 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 

module EX01a (output [4:0]s, input [1:0]a, input [3:0]b);
	assign s = a + b;
endmodule

module EX01b (output [4:0]s, input [1:0]a, input [3:0]b);
	assign s = a * b;
endmodule
	
module EX01c (output [5:0]s, input [5:0]a, input [2:0]b);
	assign s = a / b;
endmodule
	
module EX01d (output [4:0]s, input [4:0]a, input [3:0]b);
	assign s = a - b;
endmodule
	
module EX01e (output [4:0]s, input [1:0]a, input [3:0]b, input [2:0]c, input d);
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
	reg [3:0] j; 
	reg [2:0] k; 
	reg       l;  
		
	wire [4:0]sA; 
	wire [4:0]sB; 
	wire [5:0]sC; 
	wire [4:0]sD; 
	wire [4:0]sE; 
	
	EX01a letraA(sA, a, b); 
	EX01b letraB(sB, c, d);
	EX01c letraC(sC, e, f);
	EX01d letraD(sD, g, h);
	EX01e letraE(sE, i, j, k, l);
	
// ------------------------- parte principal 
initial begin 
	$display("Exemplo0016 - Rafael Santos Moura - 441705");
	$display("Test number system"); 
	
	a = 3;
	b = 14;
	$display("\nLetra A)");
	$display("%b + %b = %b", a, b, sA);
	
	c = 3;
	d = 8;
	$display("\nLetra B)");
	$display("%b * %b = %b", c, d, sB);
				
	e = 33;
	f = 5;
	$display("\nLetra C)");
	$display("%b / %b = %b", e, f, sC);
				
	g = 25;
	h = 11;
	$display("\nLetra D)");
	$display("%b - %b = %b", g, h, sD);
				
	i = 2;
	j = 8;
	k = 7;
	l = 1;
	$display("\nLetra E)");
	$display("(%b * %b) + %b - %b = %b", i, j, k, l, sE);	

end 
endmodule // test_base 
