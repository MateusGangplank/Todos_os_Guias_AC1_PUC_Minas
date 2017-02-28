module Exercicio03(vout, d, vin, a, b);
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
	xor XOR1 (d, a, b);
	not NOT1 (t1, a);
	and AND1 (vout, t1, b);
endmodule

module testeExercicio03;
	reg vin, a, b;
	wire vout, d;

	Exercicio03 FULLSUBTRACTOR(vout, d, vin, a, b);

	initial begin
		vin = 0;
		a = 0;
		b = 0;
	end

	initial begin

		$display("Exercicio 03 - Douglas Borges - 417889");
		$display("Circuito Subtrator Completo\n");

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
Exercicio 03 - Douglas Borges - 417889
Circuito Subtrator Completo

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