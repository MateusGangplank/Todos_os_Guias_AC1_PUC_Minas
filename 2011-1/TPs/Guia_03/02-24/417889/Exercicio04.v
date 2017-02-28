module Exercicio04(cout, s, a, b);
	output cout, s;
	input a, b;
	wire t1, t2;
	AndNor AND1 (cout, a, b);
	OrNor OR1 (t1, a, b);
	NotNor NOT1 (t2, cout);
	AndNor AND2 (s, t1, t2);
endmodule

module AndNor(s, a, b);
	output s;
	input a, b;
	wire t1, t2;
	nor NOR3 (t1, a, a);
	nor NOR4 (t2, b, b);
	nor NOR5 (s, t1, t2);
endmodule

module OrNor(s, a, b);
	output s;
	input a, b;
	wire t1;
	nor NOR1 (t1, a, b);
	nor NOR2 (s, t1, t1);
endmodule

module NotNor(s, a);
	output s;
	input a;
	nor NOR6 (s, a, a);
endmodule

module testeExercicio04;
	reg a, b;
	wire cout, s;

	Exercicio04 HALFADDER(cout, s, a, b);

	initial begin
		a = 0;
		b = 0;
	end

	initial begin

		$display("Exercicio 04 - Douglas Borges - 417889");
		$display("Circuito Meio-Somador com portas NOR\n");

		#1 $display("  a + b = Cout Soma");
		#1 $monitor("  %d + %d =  %d    %d", a, b, cout, s);

		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;

	end

/*
Exercicio 04 - Douglas Borges - 417889
Circuito Meio-Somador com portas NOR

  a + b = Cout Soma
  0 + 0 =  0    0
  0 + 1 =  0    1
  1 + 0 =  0    1
  1 + 1 =  1    0
*/

endmodule