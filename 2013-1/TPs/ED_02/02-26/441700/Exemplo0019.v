 // ------------------------- 
// Exemplo0019 - COMPLEMENTO DE 2 
// Nome: Mateus Lara Carvalho 
// Matricula: 441700 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 

module EX04a (output [7:0]s, input [7:0]a);
	assign s = ~a + 1;
endmodule

module EX04b (output [6:0]s, input [6:0]a);
	assign s = ~a + 1;
endmodule

module EX04c (output [5:0]s, input [5:0]a);
	assign s = ~a + 1;
endmodule

module EX04d (output [4:0]s, input [4:0]a);
	assign s = ~a + 1;
endmodule
	
module EX04e (output [7:0]s, input [7:0]a);
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
	
	EX04a letraA(sA, a); 
	EX04b letraB(sB, b);
	EX04c letraC(sC, c);
	EX04d letraD(sD, d);
	EX04e letraE(sE, e);
	
initial begin: start
	a = 6'b101111; 
	b = 57;
	c = 25;
	d = 'hD;
	e = 'o24;
end

// ------------------------- parte principal 
initial begin 
	$display("Exemplo0019 - Mateus Lara Carvalho - 441700"); 
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
