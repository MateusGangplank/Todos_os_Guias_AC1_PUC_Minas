// ------------------------- 
// Exemplo0020 - BASE 
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 

module Q05 (output [7:0]s, input [7:0]a, input [7:0]b);
	assign s = a + (~b + 1);
endmodule

module test_base_01; 
// ------------------------- definir dados 
	reg [7:0] a;
	reg [7:0] b;
	reg [7:0] c;
	reg [7:0] d;
	reg [7:0] e;  
	reg [7:0] f;
	reg [7:0] g;
	reg [7:0] h;
	reg [7:0] i;
	reg [7:0] j; 
		
	wire [7:0] sA;
	wire [7:0] sB;
	wire [7:0] sC;
	wire [7:0] sD;
	wire [7:0] sE;  
	
	Q05 letraA(sA, a, b); 
	Q05 letraB(sB, c, d);
	Q05 letraC(sC, e, f);
	Q05 letraD(sD, g, h);
	Q05 letraE(sE, i, j);
	
initial begin: start
	a = 6'b101010; 
	b = 4'b1001;
	c = 5'b11011;
	d = 4'o15;
	e = 6'o34;
	f = 4'hC;
	g = 8'hDA;
	h = 8'b10111001;
	i = 27;
	j = 5'h1B;
end
	
// ------------------------- parte principal 
initial begin
	$display("Exemplo0020 - Oswaldo Oliveira Paulino - 382175"); 
	$display("Test number system"); 
	 
	#1
	$display("\nLetra A)");
	$display("%b - %b = %b", a, b, sA);
	
	#1
	$display("\nLetra B)");
	$display("%b - %o = %b", c, d, sB);
	
	#1
	$display("\nLetra C)");
	$display("%o - %h = %b", e, f, sC);
	
	#1
	$display("\nLetra D)");
	$display("%h - %b = %b", g, h, sD);
	
	#1
	$display("\nLetra E)");
	$display("%d - %h = %b", i, j, sE);	

end 
endmodule // test_base 

// ------------------------ documentacao complementar
/*
    Exemplo0020 - Oswaldo Oliveira Paulino - 382175
    Test number system
    
    Letra A)
    00101010 - 00001001 = 00100001
    
    Letra B)
    00011011 - 015 = 00001110
    
    Letra C)
    034 - 0c = 00010000
    
    Letra D)
    da - 10111001 = 00100001
    
    Letra E)
     27 - 1b = 00000000
*/