//-------------------------
// Exemplo0019 - BASE
// Nome: Wellington Santos Correa
// Matricula: 472047	
//-------------------------
//-------------------------
// test number system
//-------------------------

module test_base_01;

//-------------------------definir dados

reg [7:0] a;
reg [6:0] b;
reg [5:0] c;
reg [4:0] d;
reg [6:0] e;
//-------------------------parte principal

initial begin

	$display("Exemplo0019 - Wellington Santos Correa - 472047");
	$display("Test number system");	
	a = ~7'b101111 + 1;
	b = ~7'd57 + 1;
	c = ~6'd25 + 1;
	d = ~5'hD + 1;
	e = ~6'o24 + 1;
	$display("\nExercicio 04"); 
	$display("a = %b", a);
	$display("b = %b", b);
	$display("c = %b", c);
	$display("d = %b", d);
	$display("e = %b", e);
	
end 

endmodule // test_base
