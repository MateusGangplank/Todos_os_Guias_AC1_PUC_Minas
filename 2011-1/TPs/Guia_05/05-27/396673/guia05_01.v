// ---------------------
// Guia 05_01 - Soma Completa 4 bits
// Nome: Anderson Belchior de Carvalho
// Matricula: 396673
// ---------------------

// ---------------------
// -- meia soma
// ---------------------

module meiasoma (s, v, p, q);

output v, s;
input p, q;

xor XOR1 (s, p, q);
and AND1 (v, p, q);

endmodule // meisoma

// ---------------------
// -- soma completa
// ---------------------

module somacompleta (s0, s1, p, q, v);

output s1, s0;
input p, q, v;
wire t1, t2, t3;

meiasoma MS1 (t2, t1, p, q);
meiasoma MS2 (s0, t3, v, t2);
or Or1 (s1, t3, t1);

endmodule // somacompleta


module Somador4bits(saida,carryout,e1,e2);

output [3:0]saida;
output carryout;
input [3:0]e1,e2;
wire carryout1,carryout2,carryout3;

meiasoma MEIASOMA (saida[0],carryout1,e1[0],e2[0]);
somacompleta SOMACOMPLETA1 (saida[1],carryout2,e1[1],e2[1],carryout1);
somacompleta SOMACOMPLETA2 (saida[2],carryout3,e1[2],e2[2],carryout2);
somacompleta SOMACOMPLETA3 (saida[3],carryout,e1[3],e2[3],carryout3);

endmodule


module testsomador4bits;
reg [3:0]e1,e2;
wire [3:0]saida;
wire carry;
integer i,j;

Somador4bits Somador4bits(saida,carry,e1,e2);

initial begin: start
		e1=0; e2=0;
end


	initial begin:main
      $display("\nguia05_01 - Anderson Belchior de Carvalho - 396673\n");
		$display("Circuito Soma Completa com 4 bits ");
		#1 $display(" e1 + e2 = carry saida ");
		#1 $monitor(" %4b + %4b = %b %4b", e1,e2,carry,saida);

		for( i=0; i<=15; i = i+1 )
		begin
			e1 = i;
			for ( j=0; j<=15; j = j+1 )
			begin
				#1 e2 = j;
			end
		end

	end

endmodule //fim guia05_01