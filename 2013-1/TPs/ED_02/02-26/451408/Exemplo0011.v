// Exemplo0011 - BASE
// Nome: Lucas Porto Lopes
// Matricula 451408

//test number system

module test_base_01;
reg [2:0] a;
reg [3:0] b;
reg [4:0] c;
reg [4:0] d;

initial begin
	$display("Exemplo0011 - Lucas Porto Lopes - 451408");
	$display("Test number system");
	
	a = 5;
	b = 10;
	c = 15;
	d = 20;
	
	$display("\nPositive value");
	$display("a = %d = %3b", a, a);
	$display("b = %d = %4b", a, a);
	$display("c = %d = %5b", a, a);
	
	$display("b = %d = %4b", b, b);
	$display("c = %d = %5b", c, c);
	$display("d = %d = %3b", d, d);
	$display("d = %d = %3o", d, d);
	$display("d = %d = %3h", d, d);
end

endmodule // test_base