//---------------------------
//Nome: Thaise Souto Martins
//Matrícula: 395504
//---------------------------

//--------------------------
// ------- Guia08-01--------
//--------------------------

module ex1(s, a, b, c, d);
	output s;
	input a, b, c, d;
	wire n1, n2, c1, c2, c3, c4;
	not NOT1(n1, a);
	not NOT2(n2, c);
	and AND1(c1, n1, c);
	and AND2(c2, b, c);
	and AND3(c3, b, d);
	and AND4(c4, a, n2, d);
	or OR1(s, c1, c2, c3, c4);
endmodule // fim ex1

module testeex1();
	reg a, b, c, d;
	wire s;
	integer numero, i, j, k, l;

	ex1 EX1(s, a, b, c, d);

	initial begin
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		numero = -1;
	end

	initial begin
		$display("Guia08-01 - Thaise Souto Martins - 395504 \n");

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
endmodule // fim testeex1
