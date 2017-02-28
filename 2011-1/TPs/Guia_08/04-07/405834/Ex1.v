


module Exercicio1 (s, a, b, c, d);
	output s;
	input a, b, c, d;
	wire f1, f2, g1, g2, g3, g4;
	not NOT1(f1, a);
	not NOT2(f2, c);
	and AND1(g1, f1, c);
	and AND2(g2, b, c);
	and AND3(g3, b, d);
	and AND4(g4, a, f2, d);
	or OR1(s, g1, g2, g3, g4);
endmodule

module TESTE ();
	reg a, b, c, d;
	wire s;
	integer numero, i, j, k, l;

	Exercicio1 Ex1 (s, a, b, c, d);

	initial begin
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		numero = -1;
	end

	initial begin
		$display("Rafael Moreira Melo_405834");

		#1 $display("   a b c d Out");

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
