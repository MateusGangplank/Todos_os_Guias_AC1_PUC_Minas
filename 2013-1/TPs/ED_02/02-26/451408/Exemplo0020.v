// Exemplo0020 - BASE
// Nome: Lucas Porto Lopes
// Matricula 451408

//test number system

module test_base_09;
reg [7:0] a;
reg [7:0] b;
reg [7:0] c;
reg [7:0] d;
reg [7:0] e;

initial begin
	$display("Exemplo0020 - Lucas Porto Lopes - 451408");
	$display("Test number system");

	a = ~(6'b101011) + (~(4'b1001) + (1'b1));
	b = ~(5'b10011) + (~('o15) + (1'b1));
	c = ~('o35) + (~('hc) + (1'b1));
	d = ~('hba) + (~(8'b10111001) + (1'b1));
	e = ~(37) + (~('h18) + (1'b1));
	
	$display("\nExercicio05");
	$display("a = %8b",a);
	$display("b = %8b",b);
	$display("c = %8b",c);
	$display("d = %8b",d);
	$display("e = %8b",e);
	
	
	
end

endmodule // test_base