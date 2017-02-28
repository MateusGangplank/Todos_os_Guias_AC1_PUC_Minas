 // ------------------------- 
// Exemplo0017 - OPERAÇÕES
// Nome: Mateus Lara Carvalho 
// Matricula: 441700 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 

module EX02a (output [6:0]s, input [5:0]a, input [4:0]b);
	assign s = a + b;
endmodule

module EX02b (output [5:0]s, input [4:0]a, input [4:0]b);
	assign s = a + b;
endmodule
	
module EX02c (output [9:0]s, input [9:0]a, input [6:0]b);
	assign s = a / b;
endmodule
	
module EX02d (output [8:0]s, input [8:0]a, input [8:0]b);
	assign s = a - b;
endmodule
	
module EX02e (output [9:0]s, input [4:0]a, input [4:0]b, input [7:0]c);
	assign s = ((a * b) + c);
endmodule

module test_base_01; 
// ------------------------- definir dados 
	reg [5:0]a; 
	reg [4:0]b; 
	reg [4:0]c; 
	reg [4:0]d;
	reg [9:0]e; 
	reg [6:0]f; 
	reg [8:0]g; 
	reg [8:0]h; 
	reg [4:0]i; 
	reg [4:0]j; 
	reg [7:0]k;   
		
	wire [6:0]sA; 
	wire [5:0]sB; 
	wire [9:0]sC; 
	wire [8:0]sD; 
	wire [9:0]sE;  
	
	EX02a letraA(sA, a, b); 
	EX02b letraB(sB, c, d);
	EX02c letraC(sC, e, f);
	EX02d letraD(sD, g, h);
	EX02e letraE(sE, i, j, k);
	
// ------------------------- parte principal 
initial begin 
	$display("Exemplo0017 - Mateus Lara Carvalho - 441700"); 
	$display("Test number system"); 
	
	a = 6'b100110;
	b = 5'b11011; 
	$display("\nLetra A)");
	$display("%b + %b = %b", a, b, sA);
	
	c = 5'b11101;
	d = 'o25;
	$display("\nLetra B)");
	$display("%b + %o = %b", c, d, sB);
				
	e = 'o1234;
	f = 'h4C;
	$display("\nLetra C)");
	$display("%o / %h = %b", e, f, sC);
				
	g = 'h1BA;
	h = 9'b101110011;
	$display("\nLetra D)");
	$display("%h - %b = %b", g, h, sD);
				
	i = 25;
	j = 'o32;
	k = 'h8A;
	$display("\nLetra E)");
	$display("(%d * %o) + %h = %b", i, j, k, sE);	

end 
endmodule // test_base 