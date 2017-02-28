 // ------------------------- 
// Exemplo0018 - COMPLEMENTO DE 2 
// Nome: Mateus Lara Carvalho 
// Matricula: 441700 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 

module EX03a (output [4:0]s, input [5:0]a);
	assign s = ~a + 1;
endmodule

module EX03b (output [3:0]s, input [4:0]a);
	assign s = ~a + 1;
endmodule

module EX03c (output [2:0]s, input [4:0]a);
	assign s = ~a + 1;
endmodule

module EX03d (output [4:0]s, input [5:0]a);
	assign s = ~a + 1;
endmodule
	
module EX03e (output [3:0]s, input [4:0]a, input [5:0]b);
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
		
	wire [4:0] sA;
	wire [3:0] sB;
	wire [2:0] sC;
	wire [4:0] sD;
	wire [3:0] sE;  
	
	EX03a letraA(sA, a); 
	EX03b letraB(sB, b);
	EX03c letraC(sC, c);
	EX03d letraD(sD, d);
	EX03e letraE(sE, e, f);

initial begin: start
	a = 6'b101010;
	b = 'o25;
	c = 27;
	d = 'h2C;
	e = 25;
	f = 35;
	
end	

// ------------------------- parte principal 
initial begin 
	$display("Exemplo0018 - Mateus Lara Carvalho - 441700"); 
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
