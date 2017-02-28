//----------------
// TP02 - 451542
//----------------

module test_base_01;
//------------------
	reg[7:0]a;
	reg[7:0]b;
	reg[7:0]c;
	reg[7:0]d;
	reg[7:0]e;
//------------------
initial begin
	$display("Exercicios: ");
	
	a = 'b101011 + ~'b1001+1;
	b = 'b10011  + ~'o15+1;
	c = 'o35     + ~'hC+1;
	d = 'hBA     + ~'b10111001+1;
	e = 'd37     + ~'h1B+1;
		
	$display("\nExercicio 5:");
	$display("a = %d = %5b", a, a);
	$display("b = %d = %5b", b, b);
	$display("c = %d = %3b", c, c);
	$display("d = %d = %4b", d, d);
	$display("e = %d = %5b", e, e);
	
	
	end
	
endmodule //test_base