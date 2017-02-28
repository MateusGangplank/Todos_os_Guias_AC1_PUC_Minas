//----------------
// TP02 - 451542
//----------------

module test_base_01;
//------------------
	reg[2:0]a;
	reg[3:0]b;
	reg[4:0]c;
	
//------------------
initial begin
	$display("Exemplo 4");
	$display("Test number system");
	
	a = 5+3;
	b = 5+3;
	c = 10-5+25+3+1;
	
	$display("\nOverflow:");
	$display("a = %d = %3b", a, a);
	$display("b = %d = %4b", b, b);
	$display("c = %d = %5b", c, c);
	
	end
	
endmodule //test_base