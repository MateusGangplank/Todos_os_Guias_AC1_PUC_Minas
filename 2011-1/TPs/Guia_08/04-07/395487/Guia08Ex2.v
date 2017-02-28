//---------------------------
//Nome: Alvaro Henrique
//Matrícula: 395487
//---------------------------

//--------------------------
// -- Guia08 Exercicio 02 --
//--------------------------


module ex2(s, a, b, c, d);
	output s;
	input a, b, c, d;
	wire n1, n2, n3, n4, c1, c2, c3;
	not NOT1(n1, a);
	not NOT2(n2, b);
	not NOT3(n3, c);
	not NOT4(n4, d);
	and AND1(c1, n1, n4);
	and AND2(c2, a, d);
	and AND3(c3, a, n2, n3);
	or OR1(s, c1, c2, c3);
endmodule // fim ex2

module testeex2();
	reg a, b, c, d;
	wire s;
	integer numero, i, j, k, l;

	ex2 EX2(s, a, b, c, d);

	initial begin
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		numero = -1;
	end

	initial begin
		$display("Guia 8 Ex1 - Alvaro Henrique - 395487 \n");
		#1 $display("   a b c d  Out");

		for(i = 0; i < 2; i = i + 1)begin
			a = i;
			for(j = 0; j < 2; j = j + 1)begin
				b = j;
				for(k = 0; k < 2; k = k + 1)begin
					c = k;
					for(l = 0; l < 2; l = l + 1)begin
						#1 d = l; numero = numero + 1;
						#1 $display("%2d %b %b %b %b  %b", numero, a, b, c, d, s);
					end
				end
			end
		end
	end
	
endmodule //fim testeex2
