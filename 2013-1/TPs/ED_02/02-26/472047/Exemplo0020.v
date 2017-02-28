//-------------------------
// Exemplo0020 - BASE
// Nome: Wellington Santos Correa
// Matricula: 472047	
//-------------------------
//-------------------------
// test number system
//-------------------------

module test_base_01;

//-------------------------definir dados

reg [7:0] a;
reg [7:0] b;
reg [7:0] c;
reg [7:0] d;
reg [7:0] e;
//-------------------------parte principal

initial begin

	$display("Exemplo0020 - Wellington Santos Correa - 472047");
	$display("Test number system");	
	a = 6'b101011 + ( ~5'b1001 + 1);
	b = 5'b10011 + (~5'o15 + 1);
	c = 5'o35 + (~5'hC + 1);
	d = 8'hBA + (~9'b10111001 + 1);
	e = 6'd37 + (~6'h1B + 1);
	$display("\nExercicio 05"); 
	$display("a = %b", a);
	$display("b = %b", b);
	$display("c = %b", c);
	$display("d = %b", d);
	$display("e = %b", e);
	
end 

endmodule // test_base
