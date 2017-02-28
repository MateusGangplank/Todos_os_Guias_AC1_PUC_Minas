//----------------
// TP02 - 451542
//----------------

module test_base_01;
//------------------
	reg[4:0]a;
	reg[3:0]b;
	reg[2:0]c;
	reg[4:0]d;
	reg[6:0]e;
//------------------
initial begin
	$display("Exercicios: ");
	
	a = ~'b101010+1;
	b = ~'o25+1;
	c = ~'d27+1;
	d = ~'h2C+1;
	e =  'd25 + ~35+1;
		
	$display("\nExercicio 3:");
	$display("a = %d = %5b", a, a);
	$display("b = %d = %5b", b, b);
	$display("c = %d = %3b", c, c);
	$display("d = %d = %4b", d, d);
	$display("e = %d = %5b", e, e);
	
	
	end
	
endmodule //test_base