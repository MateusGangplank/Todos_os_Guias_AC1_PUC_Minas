/*
	Multiplicador 3 bits

                 a2   a1   a0 
               x b2   b1   b0 
               ---------------
    p| 00   00  b0a2 b0a1|b0a0
  + q| 00  b1a2 b1a1 b1a0| 00 
    s|b2a2 b2a1 b2a0  00 | 00 
 -----------------------------
 [soma 4bits = p + q + s] b0a0

*/
module Exercicio03(produto, a, b);
	output[5:0] produto;
	input[2:0] a, b;
	wire[3:0] p, q, s, soma1, soma2;
	wire t1;

	and AND1(produto[0], b[0], a[0]);

	and AND2(p[0], b[0], a[1]);
	and AND3(p[1], b[0], a[2]);
	assign p[2] = 0;
	assign p[3] = 0;

	and AND4(q[0], b[1], a[0]);
	and AND5(q[1], b[1], a[1]);
	and AND6(q[2], b[1], a[2]);
	assign q[3] = 0;

	assign s[0] = 0;
	and AND7(s[1], b[2], a[0]); 
	and AND8(s[2], b[2], a[1]);
	and AND9(s[3], b[2], a[2]);

	somaCompleta4Bits FULLADDER4BITS1(t1, soma1, p, q);
	somaCompleta4Bits FULLADDER4BITS2(produto[5], soma2, soma1, s);
	assign produto[1] = soma2[0];
	assign produto[2] = soma2[1];
	assign produto[3] = soma2[2];
	assign produto[4] = soma2[3];
endmodule

module somaCompleta4Bits(cout, s, a, b);
	output[3:0] s;
	output cout;
	input[3:0] a, b;
	wire t1, t2, t3;

	meiaSoma HALFADDER1(t1, s[0], a[0], b[0]);
	somaCompleta FULLADDER1(t2, s[1], t1, a[1], b[1]);
	somaCompleta FULLADDER2(t3, s[2], t2, a[2], b[2]);
	somaCompleta FULLADDER3(cout, s[3], t3, a[3], b[3]);
endmodule

module somaCompleta(cout, s, cin, a, b);
	output cout, s;
	input cin, a, b;
	wire t1, t2, t3;
	meiaSoma HALFADDER1(t2, t1, a, b);
	meiaSoma HALFADDER2(t3, s, t1, cin);
	or OR1(cout, t3, t2);
endmodule

module meiaSoma(cout, s, a, b);
	output cout, s;
	input a, b;
	xor XOR1(s, a, b);
	and AND1(cout, a, b);
endmodule

module testeExercicio03;
	reg[2:0] a, b;
	wire[5:0] produto;
	integer i, j, linha;
	
	Exercicio03 MULTIPLIER3BITS(produto, a, b);

	initial begin
		a = 0;
		b = 0;
		linha = -1;
	end

	initial begin
		$display("Exercicio 03 - Douglas Borges - 417889");
		$display("Circuito Multiplicador de 3 Bits\n");

		#1 $display("      a  x  b  =  Produto");

		for(i = 0; i < 8; i = i + 1)begin
			a = i;
			for(j = 0; j < 8; j = j + 1)begin
				#1 b = j; linha = linha + 1;
				#1 $display("  %2d %3b x %3b = %6b", linha, a, b, produto);
			end
		end
	end
/*
Exercicio 03 - Douglas Borges - 417889
Circuito Multiplicador de 3 Bits

      a  x  b  =  Produto
   0 000 x 000 = 000000
   1 000 x 001 = 000000
   2 000 x 010 = 000000
   3 000 x 011 = 000000
   4 000 x 100 = 000000
   5 000 x 101 = 000000
   6 000 x 110 = 000000
   7 000 x 111 = 000000
   8 001 x 000 = 000000
   9 001 x 001 = 000001
  10 001 x 010 = 000010
  11 001 x 011 = 000011
  12 001 x 100 = 000100
  13 001 x 101 = 000101
  14 001 x 110 = 000110
  15 001 x 111 = 000111
  16 010 x 000 = 000000
  17 010 x 001 = 000010
  18 010 x 010 = 000100
  19 010 x 011 = 000110
  20 010 x 100 = 001000
  21 010 x 101 = 001010
  22 010 x 110 = 001100
  23 010 x 111 = 001110
  24 011 x 000 = 000000
  25 011 x 001 = 000011
  26 011 x 010 = 000110
  27 011 x 011 = 001001
  28 011 x 100 = 001100
  29 011 x 101 = 001111
  30 011 x 110 = 010010
  31 011 x 111 = 010101
  32 100 x 000 = 000000
  33 100 x 001 = 000100
  34 100 x 010 = 001000
  35 100 x 011 = 001100
  36 100 x 100 = 010000
  37 100 x 101 = 010100
  38 100 x 110 = 011000
  39 100 x 111 = 011100
  40 101 x 000 = 000000
  41 101 x 001 = 000101
  42 101 x 010 = 001010
  43 101 x 011 = 001111
  44 101 x 100 = 010100
  45 101 x 101 = 011001
  46 101 x 110 = 011110
  47 101 x 111 = 100011
  48 110 x 000 = 000000
  49 110 x 001 = 000110
  50 110 x 010 = 001100
  51 110 x 011 = 010010
  52 110 x 100 = 011000
  53 110 x 101 = 011110
  54 110 x 110 = 100100
  55 110 x 111 = 101010
  56 111 x 000 = 000000
  57 111 x 001 = 000111
  58 111 x 010 = 001110
  59 111 x 011 = 010101
  60 111 x 100 = 011100
  61 111 x 101 = 100011
  62 111 x 110 = 101010
  63 111 x 111 = 110001
*/
endmodule
