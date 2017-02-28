module Exercicio04(cout, s, a, b);
	output[2:0] s;
	output cout;
	input[2:0] a, b;
	wire t1, t2;

	meiaSomaNAND HALFADDER1(t1, s[0], a[0], b[0]);
	somaCompletaNAND FULLADDER1(t2, s[1], t1, a[1], b[1]);
	somaCompletaNAND FULLADDER2(cout, s[2], t2, a[2], b[2]);
endmodule

module somaCompletaNAND(cout, s, cin, a, b);
	output cout, s;
	input cin, a, b;
	wire t1, t2, t3, t4, t5;
	meiaSomaNAND HALFADDER01(t1, t2, a, b);
	meiaSomaNAND HALFADDER02(t3, s, t2, cin);
	nand NAND1(t4, t1, t1);
	nand NAND2(t5, t3, t3);
	nand NAND3(cout, t4, t5);
endmodule

module meiaSomaNAND(cout, s, a, b);
	output cout, s;
	input a, b;
	nand NAND1(t1, a, a);
	nand NAND2(t2, b, b);
	nand NAND3(t3, t1, t2);
	nand NAND4(t4, a, b);
	nand NAND5(cout, t4, t4);
	nand NAND6(t5, t3, t4);
	nand NAND7(s, t5, t5);
endmodule

module testeExercicio04;
	reg[2:0] a, b;
	wire[2:0] s;
	wire cout;
	integer i, j, linha;
	
	Exercicio04 FULLADDER3BITS(cout, s, a, b);

	initial begin
		a = 0;
		b = 0;
		linha = -1;
	end

	initial begin
		$display("Exercicio 04 - Douglas Borges - 417889");
		$display("Circuito Somador Completo de 3 Bits com portas NAND\n");

		#1 $display("      a  +  b  = C Soma");

		for(i = 0; i < 8; i = i + 1)begin
			a = i;
			for(j = 0; j < 8; j = j + 1)begin
				#1 b = j; linha = linha + 1;
				#1 $display("  %2d %3b + %3b = %b %3b", linha, a, b, cout, s);
			end
		end
	end
/*
Exercicio 04 - Douglas Borges - 417889
Circuito Somador Completo de 3 Bits com portas NAND

      a  +  b  = C Soma
   0 000 + 000 = 0 000
   1 000 + 001 = 0 001
   2 000 + 010 = 0 010
   3 000 + 011 = 0 011
   4 000 + 100 = 0 100
   5 000 + 101 = 0 101
   6 000 + 110 = 0 110
   7 000 + 111 = 0 111
   8 001 + 000 = 0 001
   9 001 + 001 = 0 010
  10 001 + 010 = 0 011
  11 001 + 011 = 0 100
  12 001 + 100 = 0 101
  13 001 + 101 = 0 110
  14 001 + 110 = 0 111
  15 001 + 111 = 1 000
  16 010 + 000 = 0 010
  17 010 + 001 = 0 011
  18 010 + 010 = 0 100
  19 010 + 011 = 0 101
  20 010 + 100 = 0 110
  21 010 + 101 = 0 111
  22 010 + 110 = 1 000
  23 010 + 111 = 1 001
  24 011 + 000 = 0 011
  25 011 + 001 = 0 100
  26 011 + 010 = 0 101
  27 011 + 011 = 0 110
  28 011 + 100 = 0 111
  29 011 + 101 = 1 000
  30 011 + 110 = 1 001
  31 011 + 111 = 1 010
  32 100 + 000 = 0 100
  33 100 + 001 = 0 101
  34 100 + 010 = 0 110
  35 100 + 011 = 0 111
  36 100 + 100 = 1 000
  37 100 + 101 = 1 001
  38 100 + 110 = 1 010
  39 100 + 111 = 1 011
  40 101 + 000 = 0 101
  41 101 + 001 = 0 110
  42 101 + 010 = 0 111
  43 101 + 011 = 1 000
  44 101 + 100 = 1 001
  45 101 + 101 = 1 010
  46 101 + 110 = 1 011
  47 101 + 111 = 1 100
  48 110 + 000 = 0 110
  49 110 + 001 = 0 111
  50 110 + 010 = 1 000
  51 110 + 011 = 1 001
  52 110 + 100 = 1 010
  53 110 + 101 = 1 011
  54 110 + 110 = 1 100
  55 110 + 111 = 1 101
  56 111 + 000 = 0 111
  57 111 + 001 = 1 000
  58 111 + 010 = 1 001
  59 111 + 011 = 1 010
  60 111 + 100 = 1 011
  61 111 + 101 = 1 100
  62 111 + 110 = 1 101
  63 111 + 111 = 1 110
*/
endmodule