// ---------------------
// Guia 03 - Exercício 01
// Nome: Luiz Guilherme Andrade Menezes
// Matricula: 292160
// ---------------------

// ---------------------
// -- half adder
// ---------------------

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

		$display("Guia 03 - Exercício 01 - Luiz Menezes - 292160");
		$display("Half Adder\n");

		#1 $display("  a + b = Cout Soma");
		#1 $monitor("  %d + %d =  %d    %d", a, b, cout, s);

		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;

	end
endmodule