//----------------
// TP02 - 451542
//----------------

module test_base_01;
//------------------
	reg[4:0]a;
	reg[4:0]b;
	reg[2:0]c;
	reg[3:0]d;
	reg[4:0]e;
//------------------
initial begin
	$display("Exercicios: ");
	
	a = 3  + 14;
	b = 3  *  8;
	c = 33 /  5;
	d = 25 - 11;
	e = 2 * 8 + 7 - 1;
		
	$display("\nExercicio 1:");
	$display("a = %d = %5b", a, a);
	$display("b = %d = %5b", b, b);
	$display("c = %d = %3b", c, c);
	$display("d = %d = %4b", d, d);
	$display("e = %d = %5b", e, e);
	
	
	end
	
endmodule //test_base