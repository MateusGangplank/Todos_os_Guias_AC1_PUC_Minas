module Exercicio01(cout, s, a, b);
	output cout, s;
	input a, b;
	wire t1, t2;
	and AND1 (cout, a, b);
	or OR1 (t1, a, b);
	not NOT1 (t2, cout);
	and AND2 (s, t1, t2);
endmodule

module testeExercicio01;
	reg a, b;
	wire cout, s;

	Exercicio01 HALFADDER(cout, s, a, b);

	initial begin
		a = 0;
		b = 0;
	end

	initial begin

		$display("Exercicio 01 - Douglas Borges - 417889");
		$display("Circuito Meio-Somador\n");

		#1 $display("  a + b = Cout Soma");
		#1 $monitor("  %d + %d =  %d    %d", a, b, cout, s);

		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;

	end

/*
Exercicio 01 - Douglas Borges - 417889
Circuito Meio-Somador

  a + b = Cout Soma
  0 + 0 =  0    0
  0 + 1 =  0    1
  1 + 0 =  0    1
  1 + 1 =  1    0
*/

endmodule