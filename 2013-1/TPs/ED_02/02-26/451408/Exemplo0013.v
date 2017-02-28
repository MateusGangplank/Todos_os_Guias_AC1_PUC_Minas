// Exemplo0013 - BASE
// Nome: Lucas Porto Lopes
// Matricula 451408

//test number system

module test_base_03;
reg [2:0] a;
reg [3:0] b;
reg [4:0] c;
reg [4:0] d;

initial begin
	$display("Exemplo0013 - Lucas Porto Lopes - 451408");
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
	
	a = -5;
	b = -5;
	c = -5;
	
	$display("\nNegative Value");
	$display("a = -5[3] = %d = %3b", a, a);
	$display("b = -5[4] = %d = %4b", b, b);
	$display("c = -5[5] = %d = %5b", c, c);
	
	a = ~5+1;
	b = ~5+1;
	c = ~5+1;
	
	$display("\nNegative Mixed expression");
	$display("a = %d = %3b", a, a);
	$display("b = %d = %4b", b, b);
	$display("c = %d = %5b", c, c);

end

endmodule // test_base