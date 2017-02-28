// ------------------------- 
// Exemplo0020 - BASE 
// Nome: Raphael Quintao
// Matricula: 445171
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 

module M (output [7:0]s, input [7:0]a, input [7:0]b);
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
	
	M A(sA, a, b); 
	M B(sB, c, d);
	M C(sC, e, f);
	M D(sD, g, h);
	M E(sE, i, j);
	
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
	$display("Exemplo0020 - Raphael Quintao - 445171"); 
	$display("Test number system"); 
	 
	#1
	$display("\na)");
	$display("%b - %b = %b", a, b, sA);
	
	$display("\nb)");
	$display("%b - %o = %b", c, d, sB);
	
	$display("\nc)");
	$display("%o - %h = %b", e, f, sC);
	
	$display("\nd)");
	$display("%h - %b = %b", g, h, sD);

	$display("\ne)");
	$display("%d - %h = %b", i, j, sE);	

end 
endmodule // test_base 


