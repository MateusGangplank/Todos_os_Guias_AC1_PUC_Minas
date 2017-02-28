module Exercicio05(vout, d, a, b);
	output[2:0] d;
	output vout;
	input[2:0] a, b;
	wire t1, t2;

	meiaDiferencaNOR HALFSUBTRACTOR1(t1, d[0], a[0], b[0]);
	diferencaCompletaNOR FULLSUBTRACTOR1(t2, d[1], t1, a[1], b[1]);
	diferencaCompletaNOR FULLSUBTRACTOR2(vout, d[2], t2, a[2], b[2]);
endmodule

module diferencaCompletaNOR(vout, d, vin, a, b);
	output vout, d;
	input vin, a, b;
	wire t1, t2, t3;
	meiaDiferencaNOR HALFSUBTRACTOR1(t2, t1, a, b);
	meiaDiferencaNOR HALFSUBTRACTOR2(t3, d, t1, vin);
	nor NOR1(t4, t3, t2);
	nor NOR2(vout, t4, t4);
endmodule

module meiaDiferencaNOR(vout, d, a, b);
	output vout, d;
	input a, b;
	wire t1, t2, t3, t4, t5;

	nor NOR1(t1, a, a);
	nor NOR2(t2, b, b);
	nor NOR3(t3, t1, t2);
	nor NOR4(t4, a, b);
	nor NOR5(d, t3, t4);
	nor NOR6(t5, b, b);
	nor NOR7(vout, a, t5);
endmodule

module testeExercicio05;
	reg[2:0] a, b;
	wire[2:0] d;
	wire vout;
	integer i, j, linha;

	Exercicio05 FULLSUBTRACTOR3BITS(vout, d, a, b);

	initial begin
		a = 0;
		b = 0;
		linha = -1;
	end

	initial begin
		$display("Exercicio 05 - Douglas Borges - 417889");
		$display("Circuito Subtrator Completo de 3 Bits com portas NOR\n");

		#1 $display("      a  -  b  = V Diferenca");

		for(i = 0; i < 8; i = i + 1)begin
			a = i;
			for(j = 0; j < 8; j = j + 1)begin
				#1 b = j; linha = linha + 1;
				#1 $display("  %2d %3b + %3b = %b %3b", linha, a, b, vout, d);
			end
		end
	end
/*
Exercicio 05 - Douglas Borges - 417889
Circuito Subtrator Completo de 3 Bits com portas NOR

      a  -  b  = V Diferenca
   0 000 + 000 = 0 000
   1 000 + 001 = 1 111
   2 000 + 010 = 1 110
   3 000 + 011 = 1 101
   4 000 + 100 = 1 100
   5 000 + 101 = 1 011
   6 000 + 110 = 1 010
   7 000 + 111 = 1 001
   8 001 + 000 = 0 001
   9 001 + 001 = 0 000
  10 001 + 010 = 1 111
  11 001 + 011 = 1 110
  12 001 + 100 = 1 101
  13 001 + 101 = 1 100
  14 001 + 110 = 1 011
  15 001 + 111 = 1 010
  16 010 + 000 = 0 010
  17 010 + 001 = 0 001
  18 010 + 010 = 0 000
  19 010 + 011 = 1 111
  20 010 + 100 = 1 110
  21 010 + 101 = 1 101
  22 010 + 110 = 1 100
  23 010 + 111 = 1 011
  24 011 + 000 = 0 011
  25 011 + 001 = 0 010
  26 011 + 010 = 0 001
  27 011 + 011 = 0 000
  28 011 + 100 = 1 111
  29 011 + 101 = 1 110
  30 011 + 110 = 1 101
  31 011 + 111 = 1 100
  32 100 + 000 = 0 100
  33 100 + 001 = 0 011
  34 100 + 010 = 0 010
  35 100 + 011 = 0 001
  36 100 + 100 = 0 000
  37 100 + 101 = 1 111
  38 100 + 110 = 1 110
  39 100 + 111 = 1 101
  40 101 + 000 = 0 101
  41 101 + 001 = 0 100
  42 101 + 010 = 0 011
  43 101 + 011 = 0 010
  44 101 + 100 = 0 001
  45 101 + 101 = 0 000
  46 101 + 110 = 1 111
  47 101 + 111 = 1 110
  48 110 + 000 = 0 110
  49 110 + 001 = 0 101
  50 110 + 010 = 0 100
  51 110 + 011 = 0 011
  52 110 + 100 = 0 010
  53 110 + 101 = 0 001
  54 110 + 110 = 0 000
  55 110 + 111 = 1 111
  56 111 + 000 = 0 111
  57 111 + 001 = 0 110
  58 111 + 010 = 0 101
  59 111 + 011 = 0 100
  60 111 + 100 = 0 011
  61 111 + 101 = 0 010
  62 111 + 110 = 0 001
  63 111 + 111 = 0 000
*/
endmodule