// Exemplo0017 - BASE
// Nome: Lucas Porto Lopes
// Matricula 451408

//test number system

module test_base_07;
reg [6:0] a;
reg [5:0] b;
reg [3:0] c;
reg [6:0] d;
reg [9:0] e;

initial begin
	$display("Exemplo0017 - Lucas Porto Lopes - 451408");
	$display("Test number system");

	a = (6'b100110) + (5'b11011);
	b = (5'b11101) + (5'o25);
	c = (11'o1234) / (7'h4c);
	d = (9'h1ba) - (9'b101110011);
	e = 25 * (5'o32) + (8'h8a);
	
	$display("\nExercicio02");
	$display("a = %10b",a);
	$display("b = %10b",b);
	$display("c = %10b",c);
	$display("d = %10b",d);
	$display("e = %10b",e);
	
	
	
end

endmodule // test_base