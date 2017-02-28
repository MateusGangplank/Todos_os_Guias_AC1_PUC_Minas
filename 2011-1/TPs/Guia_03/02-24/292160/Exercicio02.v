// ---------------------
// Guia 03 - Exerc�cio 02
// Nome: Luiz Guilherme Andrade Menezes
// Matricula: 292160
// ---------------------

// ---------------------
// -- half adder using nands
// ---------------------
module Exercicio02(cout, s, a, b);
	output cout, s;
	input a, b;
	wire t1, t2;
	AndNand AND1 (cout, a, b);
	OrNand OR1 (t1, a, b);
	NotNand NOT1 (t2, cout);
	AndNand AND2 (s, t1, t2);
endmodule

module AndNand(s, a, b);
	output s;
	input a, b;
	wire t1;
	nand NAND1 (t1, a, b);
	nand NAND2 (s, t1, t1);
endmodule

module OrNand(s, a, b);
	output s;
	input a, b;
	wire t1, t2;
	nand NAND3 (t1, a, a);
	nand NAND4 (t2, b, b);
	nand NAND5 (s, t1, t2);
endmodule

module NotNand(s, a);
	output s;
	input a;
	nand NAND6 (s, a, a);
endmodule

module testeExercicio02;
	reg a, b;
	wire cout, s;

	Exercicio02 HALFADDER(cout, s, a, b);

	initial begin
		a = 0;
		b = 0;
	end

	initial begin

		$display("Guia 03 - Exerc�cio 02 - Luiz Menezes - 292160");
		$display("Half Adder using NAND\n");

		#1 $display("  a + b = Cout Soma");
		#1 $monitor("  %d + %d =  %d    %d", a, b, cout, s);

		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;

	end

endmodule