module Exercicio05(vout, d, vin, a, b);
	output vout, d;
	input vin, a, b;
	wire t1, t2, t3;
	meiaDiferenca MS1 (t2, t1, a, b);
	meiaDiferenca MS2 (t3, d, t1, vin);
	or OR1 (vout, t3, t2);
endmodule

module meiaDiferenca(vout, d, a, b);
	output vout, d;
	input a, b;
	wire t1;
	XorNand XOR1 (d, a, b);
	NotNand NOT1 (t1, a);
	AndNand AND1 (vout, t1, b);
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

module testeExercicio05;
	reg vin, a, b;
	wire vout, d;

	Exercicio05 FULLSUBTRACTOR(vout, d, vin, a, b);

	initial begin
		vin = 0;
		a = 0;
		b = 0;
	end

	initial begin

		$display("Exercicio 05 - Douglas Borges - 417889");
		$display("Circuito Subtrator Completo com portas NAND\n");

		#1 $display("  a - b - Vin = Vout Dif");
		#1 $monitor("  %b   %b    %b  =  %d    %d", a, b, vin, vout, d);

		#1 vin = 0; a = 0; b = 1;
		#1 vin = 0; a = 1; b = 0;
		#1 vin = 0; a = 1; b = 1;
		#1 vin = 1; a = 0; b = 0;
		#1 vin = 1; a = 0; b = 1;
		#1 vin = 1; a = 1; b = 0;
		#1 vin = 1; a = 1; b = 1;

	end

/*
Exercicio 05 - Douglas Borges - 417889
Circuito Subtrator Completo com portas NAND

  a - b - Vin = Vout Dif
  0   0    0  =  0    0
  0   1    0  =  1    1
  1   0    0  =  0    1
  1   1    0  =  0    0
  0   0    1  =  1    1
  0   1    1  =  1    0
  1   0    1  =  0    0
  1   1    1  =  1    1
*/

endmodule