//-------------------------
// Exemplo0017 - BASE
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
reg [9:0] c;
reg [6:0] d;
reg [9:0] e;
//-------------------------parte principal

initial begin

	$display("Exemplo0017 - Wellington Santos Correa - 472047");
	$display("Test number system");	


	a = 6'b100110 + 5'b11011; 
	b = 5'b11101 + 5'o25;
	c = 10'o1234 + 7'h4C;
	d = 9'h1BA - 9'b101110011;
	e = 5'o25 * 5'o32 + 8'h8A;
	$display("\nExercicio 02"); 
	$display("a = %b", a);
	$display("b = %b", b);
	$display("c = %b", c);
	$display("d = %b", d);
	$display("e = %b", e);
	
end 

endmodule // test_base
