module Exercicio04(s, a, b, c, d);
	output s;
	input a, b, c, d;
	wire na, nc, t1, t2, t3, t4;
	notNand NOT1(na, a);
	notNand NOT2(nc, c);
	andNand AND1(t1, na, c);
	andNand AND2(t2, b, c);
	andNand AND3(t3, b, d);
	andNand3b AND4(t4, a, nc, d);
	orNand4b OR1(s, t1, t2, t3, t4);
endmodule

module notNand(s, a);
	output s;
	input a;
	nand NAND1(s, a, a);
endmodule

module andNand(s, a, b);
	output s;
	input a, b;
	wire temp;
	nand NAND1(temp, a, b);
	nand NAND2(s, temp, temp);
endmodule

module andNand3b(s, a, b, c);
	output s;
	input a, b, c;
	wire temp;
	nand NAND1(temp, a, b, c);
	nand NAND2(s, temp, temp);
endmodule

module orNand4b(s, a, b, c, d);
	output s;
	input a, b, c, d;
	wire t1, t2, t3, t4;
	nand NAND1(t1, a, a);
	nand NAND2(t2, b, b);
	nand NAND3(t3, c, c);
	nand NAND4(t4, d, d);
	nand NAND5(s, t1, t2, t3, t4);
endmodule

module testeExercicio04();
	reg a, b, c, d;
	wire s;
	integer linha, i, j, k, l;

	Exercicio04 CIRCUITO(s, a, b, c, d);

	initial begin
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		linha = -1;
	end

	initial begin
		$display("Exercicio 04 - Douglas Borges - 417889\n");

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
Exercicio 04 - Douglas Borges - 417889

   a b c d  S
 0 0 0 0 0  0
 1 0 0 0 1  0
 2 0 0 1 0  1
 3 0 0 1 1  1
 4 0 1 0 0  0
 5 0 1 0 1  1
 6 0 1 1 0  1
 7 0 1 1 1  1
 8 1 0 0 0  0
 9 1 0 0 1  1
10 1 0 1 0  0
11 1 0 1 1  0
12 1 1 0 0  0
13 1 1 0 1  1
14 1 1 1 0  1
15 1 1 1 1  1
*/
endmodule