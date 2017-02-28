// ---------------------
// Guia 05_03 - Produto completo de dois valores binárioscom três bits cada.
// Nome: Anderson Belchior de Carvalho
// Matricula: 396673
// ---------------------

module meiasoma(saida,carry,e1,e2);
output saida,carry;
input e1,e2;

xor xor1 (saida,e1,e2);
and and1 (carry,e1,e2);

endmodule


module somacompleta (soma,carryout,e1,e2,carryin);
output soma,carryout;
input e1,e2,carryin;
wire carry2;

meiasoma MeiaSoma1 (saida,carry,e1,e2);
meiasoma MeiaSoma2 (soma,carry2,saida,carryin);
or OR1 (carryout,carry2,carry);


endmodule


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

module Multiplicador3bits(saidadefinitiva,s0,carryout,e1,e2);

output [3:0]saidadefinitiva;
output carryout;
output s0;
input [3:0]e1,e2;
wire [3:0]a,b,temp2,saida;
wire carryout1;


and AND13 (s0,e1[0],e2[0]);
and AND2 (b[0],e1[0],e2[1]);
and AND3 (b[1],e1[1],e2[1]);
and AND4 (b[2],e1[2],e2[1]);
and AND12 (b[3],0,0);
and AND5 (a[0],e1[1],e2[0]);
and AND10 (a[1],0,0);
and AND11 (a[2],0,0);
and AND6 (a[3],e1[2],e2[1]);

and AND7 (temp2[0],e1[2],e2[2]);
and AND8 (temp2[1],e1[1],e2[2]);
and AND9 (temp2[2],e1[0],e2[2]);
and AND14 (temp2[3],0,0);

Somador4bits SOMADOR1(saida,carryout1,a,b);
Somador4bits SOMADOR2(saidadefinitiva,carryout,saida,temp2);


endmodule


module testmultiplicador3bits;
reg [3:0]e1,e2;
wire [3:0]saidadefinitiva;
wire carryout;
integer i,j;
 
Multiplicador3bits MULTIPLICADOR(saidadefinitiva,s0,carryout,e1,e2);

initial begin: start
		e1=0; e2=0;
end


	initial begin:main

      $display("\nguia05_03 - Anderson Belchior de Carvalho - 396673\n");
		$display("Circuito Multiplicador com 3 bits ");
		#1 $display(" e1 + e2 = carry   saida ");
		#1 $monitor(" %4b + %4b = %b    %4b%b", e1,e2,carryout,saidadefinitiva,s0);

		for( i=0; i<=7; i = i+1 )
		begin
			e1 = i;
			for ( j=0; j<=7; j = j+1 )
			begin
				#1 e2 = j;
			end
		end

	end

endmodule //fim guia05_03