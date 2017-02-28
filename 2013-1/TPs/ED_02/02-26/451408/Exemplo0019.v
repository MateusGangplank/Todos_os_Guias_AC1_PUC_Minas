// Exemplo0019 - BASE
// Nome: Lucas Porto Lopes
// Matricula 451408

//test number system

module test_base_09;
reg [7:0] a;
reg [6:0] b;
reg [5:0] c;
reg [4:0] d;
reg [7:0] e;

initial begin
	$display("Exemplo0019 - Lucas Porto Lopes - 451408");
	$display("Test number system");

	a = ~(6'b101111) + (1'b1);
	b = ~(6'b111001) + (1'b1);
	c = ~(25) + (1'b1);
	d = ~('hd) + (1'b1);
	e = ~('o24) + (1'b1);
	
	$display("\nExercicio04");
	$display("a = %8b",a);
	$display("b = %8b",b);
	$display("c = %8b",c);
	$display("d = %8b",d);
	$display("e = %8b",e);
	
	
	
end

endmodule // test_base