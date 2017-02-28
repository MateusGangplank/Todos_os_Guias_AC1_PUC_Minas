//-------------------------
// Exemplo0018 - BASE
// Nome: Wellington Santos Correa
// Matricula: 472047	
//-------------------------
//-------------------------
// test number system
//-------------------------

module test_base_01;

//-------------------------definir dados

reg [6:0] a;
reg [5:0] b;
reg [5:0] c;
reg [6:0] d;
reg [6:0] e;
//-------------------------parte principal

initial begin

	$display("Exemplo0018 - Wellington Santos Correa - 472047");
	$display("Test number system");	
	a = ~7'b101010 + 1;
	b = ~6'o25 + 1;
	c = ~6'd25 + 1;
	d = ~6'h2C + 1;
	e = 6'h25 + ( ~ 6'h35 ) + 1;
	$display("\nExercicio 03"); 
	$display("a = %b", a);
	$display("b = %b", b);
	$display("c = %b", c);
	$display("d = %b", d);
	$display("e = %b", e);
	
end 

endmodule // test_base
