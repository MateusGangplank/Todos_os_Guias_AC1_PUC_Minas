//----------------
// TP02 - 451542
//----------------

module test_base_01;
//------------------
	reg[2:0]a;
	reg[3:0]b;
	reg[5:0]c;
	
//------------------
initial begin
	$display("Exemplo 5");
	$display("Test number system");
	
	a = 5+3;
	b = 5+3;
	c = 10 - 5 + 25 + 3 + 1;
	
	$display("\nComplements:");
	$display("0 = %d = %3b = %3b = ", ~1, (1-1), ~1);
	$display("1 = %d = %3b = %3b = ", ~0, (2-1), ~0);
	$display("2 = %d = %3b = %3b = ", (1+1), (3-1), ~0+~0);
	
	end
endmodule //test_base