//-------------------------
// Exemplo0016 - BASE
// Nome: Wellington Santos Correa
// Matricula: 472047	
//-------------------------
//-------------------------
// test number system
//-------------------------

module test_base_01;

//-------------------------definir dados

reg [4:0] a;
reg [5:0] b;
reg [2:0] c;
reg [3:0] d;
reg [4:0] e;
//-------------------------parte principal

initial begin

	$display("Exemplo0016 - Wellington Santos Correa - 472047");
	$display("Test number system");	
	a = 3 + 14;
	b = 3 * 8;
	c = 33 / 5;
	d = 25 - 11;
	e = 2 * 8 + 7 - 1;
	$display("\nExercicio 01");		
	$display("a = %5b", a);
	$display("b = %6b", b);
	$display("c = %3b", c);
	$display("b = %4b", d);
	$display("c = %5b", e);
end 

endmodule // test_base
