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
	a = 8'b101010; 
	b = 4'b1101;
	c = 5'b11010;
	d = 6'o15;
	e = 6'o34;
	f = 4'hB;
	g = 8'hCA;
	h = 8'b10111001;
	i = 5'd25;
	j = 8'h1A;
end
	
// ------------------------- parte principal 
initial begin
	$display("Exemplo0020 - Oswaldo Oliveira Paulino - 382175"); 
	$display("Test number system"); 
	 
	#1
	$display("\nLetra A)");
	$display("%8b - %8b = %b", a, b, sA);
	
	#1
	$display("\nLetra B)");
	$display("%8b - %8o = %b", c, d, sB);
	
	#1
	$display("\nLetra C)");
	$display("%8o - %8h = %b", e, f, sC);
	
	#1
	$display("\nLetra D)");
	$display("%8H - %8b = %b", g, h, sD);
	
	#1
	$display("\nLetra E)");
	$display("%8d - %8h = %b", i, j, sE);	

end 
endmodule // test_base 

// ------------------------ documentacao complementar
/*
    Exemplo0020 - Oswaldo Oliveira Paulino - 382175
    Test number system
    
    Letra A)
    00101010 - 00001101 = 00011101
    
    Letra B)
    00011010 -      015 = 00001101
    
    Letra C)
         034 -       0b = 00010001
    
    Letra D)
          ca - 10111001 = 00010001
    
    Letra E)
          25 -       1a = 11111111
*/