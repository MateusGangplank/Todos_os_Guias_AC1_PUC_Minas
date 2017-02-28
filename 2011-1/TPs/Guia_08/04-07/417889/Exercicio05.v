module Exercicio05(s, a, b, c, d);
	output s;
	input a, b, c, d;
	wire na, nb, nc, nd, t1, t2, t3;
	notNor NOT1(na, a);
	notNor NOT2(nb, b);
	notNor NOT3(nc, c);
	notNor NOT4(nd, d);
	andNor AND1(t1, na, nd);
	andNor AND2(t2, a, d);
	andNor3b AND3(t3, a, nb, nc);
	orNor3b OR1(s, t1, t2, t3);
endmodule

module notNor(s, a);
	output s;
	input a;
	nor NOR1(s, a, a);
endmodule

module andNor(s, a, b);
	output s;
	input a, b;
	wire t1, t2;
	nor NOR1(t1, a, a);
	nor NOR2(t2, b, b);
	nor NOR3(s, t1, t2);
endmodule

module andNor3b(s, a, b, c);
	output s;
	input a, b, c;
	wire t1, t2, t3;
	nor NOR1(t1, a, a);
	nor NOR2(t2, b, b);
	nor NOR2(t3, c, c);
	nor NOR3(s, t1, t2, t3);
endmodule

module orNor3b(s, a, b, c);
	output s;
	input a, b, c;
	wire temp;
	nor NOR1(temp, a, b, c);
	nor NOR2(s, temp, temp);
endmodule

module testeExercicio05();
	reg a, b, c, d;
	wire s;
	integer linha, i, j, k, l;

	Exercicio05 CIRCUITO(s, a, b, c, d);

	initial begin
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		linha = -1;
	end

	initial begin
		$display("Exercicio 05 - Douglas Borges - 417889\n");

		#1 $display("   a b c d  S");

		for(i = 0; i < 2; i = i + 1)begin
			a = i;
			for(j = 0; j < 2; j = j + 1)begin
				b = j;
				for(k = 0; k < 2; k = k + 1)begin
					c = k;
					for(l = 0; l < 2; l = l + 1)begin
						#1 d = l; linha = linha + 1;
						#1 $display("%2d %b %b %b %b  %b", linha, a, b, c, d, s);
					end
				end
			end
		end
	end

/*
Exercicio 05 - Douglas Borges - 417889

   a b c d  S
 0 0 0 0 0  1
 1 0 0 0 1  0
 2 0 0 1 0  1
 3 0 0 1 1  0
 4 0 1 0 0  1
 5 0 1 0 1  0
 6 0 1 1 0  1
 7 0 1 1 1  0
 8 1 0 0 0  1
 9 1 0 0 1  1
10 1 0 1 0  0
11 1 0 1 1  1
12 1 1 0 0  0
13 1 1 0 1  1
14 1 1 1 0  0
15 1 1 1 1  1
*/
endmodule