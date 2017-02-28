//----------------
// TP02 - 451542
//----------------

module test_base_01;
//------------------
	reg[6:0]a;
	reg[5:0]b;
	reg[3:0]c;
	reg[6:0]d;
	reg[9:0]e;
//------------------
initial begin
	$display("Exercicios: ");
	
	a = 'b100110 + 'b11011;
	b = 'b11101  + 'o25;
	c = 'o1234    / 'h4C;
	d = 'h1BA    + ~'b101110011+1;
	e = 'd25     *'o32   + 'h8A;
		
	$display("\nExercicio 2:");
	$display("a = %d = %5b", a, a);
	$display("b = %d = %5b", b, b);
	$display("c = %d = %3b", c, c);
	$display("d = %d = %4b", d, d);
	$display("e = %d = %5b", e, e);
	
	
	end
	
endmodule //test_base