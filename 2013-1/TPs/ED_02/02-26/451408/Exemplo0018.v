// Exemplo0018 - BASE
// Nome: Lucas Porto Lopes
// Matricula 451408

//test number system

module test_base_08;
reg [4:0] a;
reg [3:0] b;
reg [2:0] c;
reg [4:0] d;
reg [3:0] e;

initial begin
	$display("Exemplo0018 - Lucas Porto Lopes - 451408");
	$display("Test number system");

	a = ~(6'b101010) + (1'b1);
	b = ~(5'o25) + (1'b1);
	c = ~(27) + (1'b1);
	d = ~(9'h2c) + (1'b1);
	e = ~(25 - 32) + (1'b1);
	
	$display("\nExercicio03");
	$display("a = %5b",a);
	$display("b = %5b",b);
	$display("c = %5b",c);
	$display("d = %5b",d);
	$display("e = %5b",e);
	
	
	
end

endmodule // test_base