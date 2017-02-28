module Exercicio3 (s, a, b, c, d,e);

	output s;
	input a, b, c, d, e;
	wire f1, f2, f3, f4, g1, g2, g3, g4, g5;
	not NOT1(f1, a);
	not NOT2(f2, b);
	not NOT3(f3, c);
	not NOT4(f4, d);
	and AND1(g1, f2, e);
	and AND2(g2, c, e);
	and AND3(g3, f1, f3, f4);
	and AND4(g4, a, c, f4);
	and AND5(g5, a, f2, f3, d);
	or OR1(s, g1, g2, g3, g4, g5);

endmodule 

module TESTE ();
	
	reg a, b, c, d,e;
	wire s;
	integer numero, i, j, k, l,m;
	
	ex3 EX3(s, a, b, c, d,e);

	initial begin
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		e = 0;
		numero = -1;
	end
	
	initial begin
		$display("Rafael Moreira Melo_405834");

		#1 $display("   a b c d e Out");
		
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
	
endmodule
