//----------------
// TP02 - 451542
//----------------

module test_base_01;
//------------------
	reg[7:0]a;
	reg[6:0]b;
	reg[5:0]c;
	reg[4:0]d;
	reg[7:0]e;
//------------------
initial begin
	$display("Exercicios: ");
	
	a = ~'b101111+1;
	b = ~'b111001+1;
	c = ~'d25+1;
	d = ~'hD+1;
	e = ~'o24+1;
		
	$display("\nExercicio 4:");
	$display("a = %d = %5b", a, a);
	$display("b = %d = %5b", b, b);
	$display("c = %d = %3b", c, c);
	$display("d = %d = %4b", d, d);
	$display("e = %d = %5b", e, e);
	
	
	end
	
endmodule //test_base