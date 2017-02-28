


module Exercicio2 (s, a, b, c, d);
	output s;
	input a, b, c, d;
	wire f1, f2, f3, f4, g1, g2, g3;
	not NOT1(f1, a);
	not NOT2(f2, b);
	not NOT3(f3, c);
	not NOT4(f4, d);
	and AND1(g1, f1, f4);
	and AND2(g2, a, d);
	and AND3(g3, a, f2, f3);
	or OR1(s, g1, g2, g3);
endmodule

module TESTE ();
	reg a, b, c, d;
	wire s;
	integer numero, i, j, k, l;

	Exercicio2 EX2(s, a, b, c, d);

	initial begin
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		numero = -1;
	end

	initial begin
		$display("Rafael Moreira Melo_405834");
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
	
endmodule
