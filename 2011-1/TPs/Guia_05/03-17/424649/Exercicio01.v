// Nome: Giselle Caroline Vieira
// Matrícula:424649


module metodomeiasoma(saida,carry,e1,e2);
output saida,carry;
input e1,e2;

xor xor1 (saida,e1,e2);
and and1 (carry,e1,e2);

endmodule


module metodosomacompleta (soma,carryout,e1,e2,carryin);
output soma,carryout;
input e1,e2,carryin;
wire carry2;

metodomeiasoma MeiaSoma1 (saida,carry,e1,e2);
metodomeiasoma MeiaSoma2 (soma,carry2,saida,carryin);
or OR1 (carryout,carry2,carry);


endmodule


module metodoSomador4bits(saida,carryout,e1,e2);

output [3:0]saida;
output carryout;
input [3:0]e1,e2;
wire carryout1,carryout2,carryout3;

metodomeiasoma MEIASOMA (saida[0],carryout1,e1[0],e2[0]);
metodosomacompleta SOMACOMPLETA1 (saida[1],carryout2,e1[1],e2[1],carryout1);
metodosomacompleta SOMACOMPLETA2 (saida[2],carryout3,e1[2],e2[2],carryout2);
metodosomacompleta SOMACOMPLETA3 (saida[3],carryout,e1[3],e2[3],carryout3);

endmodule


module testsomador4bits;
reg [3:0]e1,e2;
wire [3:0]saida;
wire carry;
integer i,j;

metodoSomador4bits Somador4bits(saida,carry,e1,e2);

initial begin: start
		e1=0; e2=0;
end


	initial begin:main

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

endmodule

