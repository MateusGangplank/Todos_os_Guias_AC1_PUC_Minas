module Exercicio03(s, a, b, c, d, e);
	output s;
	input a, b, c, d, e;
	wire na, nb, nc, nd, t1, t2, t3, t4, t5;
	not NOT1(na, a);
	not NOT2(nb, b);
	not NOT3(nc, c);
	not NOT4(nd, d);
	and AND1(t1, nb, e);
	and AND2(t2, c, e);
	and AND3(t3, na, nc, nd);
	and AND4(t4, a, c, nd);
	and AND5(t5, a, nb, nc, d);
	or OR1(s, t1, t2, t3, t4, t5);
endmodule

module testeExercicio03();
	reg a, b, c, d, e;
	wire s;
	integer linha, i, j, k, l, m;

	Exercicio03 CIRCUITO(s, a, b, c, d, e);

	initial begin
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		e = 0;
		linha = -1;
	end

	initial begin
		$display("Exercicio 03 - Douglas Borges - 417889\n");

		#1 $display("   a b c d e  S");

		for(i = 0; i < 2; i = i + 1)begin
			a = i;
			for(j = 0; j < 2; j = j + 1)begin
				b = j;
				for(k = 0; k < 2; k = k + 1)begin
					c = k;
					for(l = 0; l < 2; l = l + 1)begin
						d = l;
						for(m = 0; m < 2; m = m + 1)begin
							#1 e = m; linha = linha + 1;
							#1 $display("%2d %b %b %b %b %b  %b", linha, a, b, c, d, e, s);
						end
					end
				end
			end
		end
	end

/*
Exercicio 03 - Douglas Borges - 417889

   a b c d e  S
 0 0 0 0 0 0  1
 1 0 0 0 0 1  1
 2 0 0 0 1 0  0
 3 0 0 0 1 1  1
 4 0 0 1 0 0  0
 5 0 0 1 0 1  1
 6 0 0 1 1 0  0
 7 0 0 1 1 1  1
 8 0 1 0 0 0  1
 9 0 1 0 0 1  1
10 0 1 0 1 0  0
11 0 1 0 1 1  0
12 0 1 1 0 0  0
13 0 1 1 0 1  1
14 0 1 1 1 0  0
15 0 1 1 1 1  1
16 1 0 0 0 0  0
17 1 0 0 0 1  1
18 1 0 0 1 0  1
19 1 0 0 1 1  1
20 1 0 1 0 0  1
21 1 0 1 0 1  1
22 1 0 1 1 0  0
23 1 0 1 1 1  1
24 1 1 0 0 0  0
25 1 1 0 0 1  0
26 1 1 0 1 0  0
27 1 1 0 1 1  0
28 1 1 1 0 0  1
29 1 1 1 0 1  1
30 1 1 1 1 0  0
31 1 1 1 1 1  1
*/
endmodule