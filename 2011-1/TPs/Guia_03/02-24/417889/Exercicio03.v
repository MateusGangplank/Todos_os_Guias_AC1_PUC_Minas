module Exercicio03(vin, d, a, b);
	output vin, d;
	input a, b;
	wire t1;
	XorNand XOR1 (d, a, b);
	NotNand NOT1 (t1, a);
	AndNand AND1 (vin, t1, b);
endmodule

module AndNand(s, a, b);
	output s;
	input a, b;
	wire t1;
	nand NAND1 (t1, a, b);
	nand NAND2 (s, t1, t1);
endmodule

module XorNand(s, a, b);
	output s;
	input a, b;
	wire t1, t2, t3;
	nand NAND3 (t1, a, b);
	nand NAND4 (t2, t1, a);
	nand NAND5 (t3, t1, b);
	nand NAND5 (s, t2, t3);
endmodule

module NotNand(s, a);
	output s;
	input a;
	nand NAND6 (s, a, a);
endmodule

module testeExercicio03;
	reg a, b;
	wire vin, d;

	Exercicio03 HALFSUBTRACTOR(vin, d, a, b);

	initial begin
		a = 0;
		b = 0;
	end

	initial begin

		$display("Exercicio 03 - Douglas Borges - 417889");
		$display("Circuito Meio-Diferenciador com portas NAND\n");

		#1 $display("  a - b = Vin Dif");
		#1 $monitor("  %d - %d =  %d   %d", a, b, vin, d);

		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;

	end

/*
Exercicio 03 - Douglas Borges - 417889
Circuito Meio-Diferenciador com portas NAND

  a - b = Vin Dif
  0 - 0 =  0   0
  0 - 1 =  1   1
  1 - 0 =  0   1
  1 - 1 =  0   0
*/

endmodule