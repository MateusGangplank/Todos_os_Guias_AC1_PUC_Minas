module Exercicio05(vin, d, a, b);
	output vin, d;
	input a, b;
	wire t1;
	XorNor XOR1 (d, a, b);
	NotNor NOT1 (t1, a);
	AndNor AND1 (vin, t1, b);
endmodule

module AndNor(s, a, b);
	output s;
	input a, b;
	wire t1, t2;
	nor NOR1 (t1, a, a);
	nor NOR2 (t2, b, b);
	nor NOR3 (s, t1, t2);
endmodule

module XorNor(s, a, b);
	output s;
	input a, b;
	wire t1, t2, t3, t4;
	nor NOR4 (t1, a, a);
	nor NOR5 (t2, b, b);
	nor NOR7 (t3, a, b);
	nor NOR8 (t4, t1, t2);
	nor NOR9 (s, t3, t4);
endmodule

module NotNor(s, a);
	output s;
	input a;
	nor NOR10 (s, a, a);
endmodule

module testeExercicio05;
	reg a, b;
	wire vin, d;

	Exercicio05 HALFSUBTRACTOR(vin, d, a, b);

	initial begin
		a = 0;
		b = 0;
	end

	initial begin

		$display("Exercicio 05 - Douglas Borges - 417889");
		$display("Circuito Meio-Diferenciador com portas NOR\n");

		#1 $display("  a - b = Vin Dif");
		#1 $monitor("  %d - %d =  %d   %d", a, b, vin, d);

		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;

	end

/*
Exercicio 05 - Douglas Borges - 417889
Circuito Meio-Diferenciador com portas NOR

  a - b = Vin Dif
  0 - 0 =  0   0
  0 - 1 =  1   1
  1 - 0 =  0   1
  1 - 1 =  0   0
*/

endmodule