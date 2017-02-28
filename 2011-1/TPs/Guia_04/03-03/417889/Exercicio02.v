module Exercicio02(cout, s, cin, a, b);
	output cout, s;
	input cin, a, b;
	wire t1, t2, t3;
	meiaSoma MS1 (t2, t1, a, b);
	meiaSoma MS2 (t3, s, t1, cin);
	or OR1 (cout, t3, t2);
endmodule

module meiaSoma(cout, s, a, b);
	output cout, s;
	input a, b;
	xor XOR1 (s, a, b);
	and AND1 (cout, a, b);
endmodule

module testeExercicio02;
	reg cin, a, b;
	wire cout, s;

	Exercicio02 FULLADDER(cout, s, cin, a, b);

	initial begin
		cin = 0;
		a = 0;
		b = 0;
	end

	initial begin

		$display("Exercicio 02 - Douglas Borges - 417889");
		$display("Circuito Somador Completo\n");

		#1 $display("  a + b + Cin  =  Cout Soma");
		#1 $monitor("  %b   %b    %b       %d    %d", a, b, cin, cout, s);

		#1 cin = 0; a = 0; b = 1;
		#1 cin = 0; a = 1; b = 0;
		#1 cin = 0; a = 1; b = 1;
		#1 cin = 1; a = 0; b = 0;
		#1 cin = 1; a = 0; b = 1;
		#1 cin = 1; a = 1; b = 0;
		#1 cin = 1; a = 1; b = 1;

	end

/*
Exercicio 02 - Douglas Borges - 417889
Circuito Somador Completo

  a + b + Cin  =  Cout Soma
  0   0    0       0    0
  0   1    0       0    1
  1   0    0       0    1
  1   1    0       1    0
  0   0    1       0    1
  0   1    1       1    0
  1   0    1       1    0
  1   1    1       1    1
*/

endmodule