// ---------------------
// Guia 08_03
// Nome: Anderson Belchior de Carvalho
// Matricula: 396673
// ---------------------

//--------------------------
// -- Exercicio 3
//--------------------------

module exercicio3(s, a, b, c, d,e);

	output s;
	input a, b, c, d, e;
	wire n1, n2, n3, n4, c1, c2, c3, c4, c5;
	not NOT1(n1, a);
	not NOT2(n2, b);
	not NOT3(n3, c);
	not NOT4(n4, d);
	and AND1(c1, n2, e);
	and AND2(c2, c, e);
	and AND3(c3, n1, n3, n4);
	and AND4(c4, a, c, n4);
	and AND5(c5, a, n2, n3, d);
	or OR1(s, c1, c2, c3, c4, c5);
endmodule //fim exercicio3

module testexercicio3();
	
	reg a, b, c, d,e;
	wire s;
	integer numero, i, j, k, l,m;
	
	exercicio3 EX3(s, a, b, c, d,e);

	initial begin
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		e = 0;
		numero = -1;
	end
	
	initial begin
		$display("Guia 08_03 - Anderson Belchior de Carvalho - 396673 \n");

		#1 $display("   a b c d e out");
		
		for(i = 0; i < 2; i = i + 1)begin
			a = i;
			for(j = 0; j < 2; j = j + 1)begin
				b = j;
				for(k = 0; k < 2; k = k + 1)begin
					c = k;
					for(l = 0; l < 2; l = l + 1)begin
						d = l;
						for(m = 0; m < 2; m = m + 1)begin
							#1 e = m; numero = numero + 1;
							#1 $display("%2d %b %b %b %b %b  %b", numero, a, b, c, d, e, s);
						end
					end
				end
			end
		end
	end
	
endmodule // fim testexercicio3


