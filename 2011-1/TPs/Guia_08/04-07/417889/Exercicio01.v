//---------------------------
//Nome: Caio Ragacci Pimentel
//Matrícula: 405794
//---------------------------

//--------------------------
// ------- Guia08-01--------
//--------------------------

module Exercicio01(s, a, b, c, d);
	output s;
	input a, b, c, d;
	wire na, nc, t1, t2, t3, t4;
	not NOT1(na, a);
	not NOT2(nc, c);
	and AND1(t1, na, c);
	and AND2(t2, b, c);
	and AND3(t3, b, d);
	and AND4(t4, a, nc, d);
	or OR1(s, t1, t2, t3, t4);
endmodule

module testeExercicio01();
	reg a, b, c, d;
	wire s;
	integer linha, i, j, k, l;

	Exercicio01 CIRCUITO(s, a, b, c, d);

	initial begin
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		linha = -1;
	end

	initial begin
		$display("Exercicio 02 - Douglas Borges - 417889\n");

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
Exercicio 01 - Douglas Borges - 417889

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