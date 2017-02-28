module metodomeiasoma(saida,carry,a,b);
output saida,carry;
input a,b;

xor xor1 (saida,a,b);
and and1 (carry,a,b);

endmodule


module metodosomacompleta (soma,carryout,a,b,carryin);
output soma,carryout;
input a,b,carryin;
wire carry2;

metodomeiasoma MeiaSoma1 (saida,carry,a,b);
metodomeiasoma MeiaSoma2 (soma,carry2,saida,carryin);
or OR1 (carryout,carry2,carry);


endmodule


module metodoSomador4bits(saida,carryout,a,b);

output [3:0]saida;
output carryout;
input [3:0]a,b;
wire carryout1,carryout2,carryout3;

metodomeiasoma MEIASOMA (saida[0],carryout1,a[0],b[0]);
metodosomacompleta SOMACOMPLETA1 (saida[1],carryout2,a[1],b[1],carryout1);
metodosomacompleta SOMACOMPLETA2 (saida[2],carryout3,a[2],b[2],carryout2);
metodosomacompleta SOMACOMPLETA3 (saida[3],carryout,a[3],b[3],carryout3);

endmodule

module metodoMultiplicador3bits(saidadefinitiva,s0,carryout,a,b);

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

metodoSomador4bits SOMADOR1(saida,carryout1,a,b);
metodoSomador4bits SOMADOR2(saidadefinitiva,carryout,saida,temp2);


endmodule


module testmultiplicador3bits;
reg [3:0]a,b;
wire [3:0]saidadefinitiva;
wire carryout;
integer i,j;
 

metodoMultiplicador3bits MULTIPLICADOR(saidadefinitiva,s0,carryout,a,b);

initial begin: start
		a=0; b=0;
end


	initial begin:main
    $display("Larissa Fernandes leijôto-410476 ");
		$display("Circuito Soma Completa com 4 bits ");
		#1 $display(" e1 + e2 = carry   saida ");
		#1 $monitor(" %4b + %4b = %b    %4b%b", a,b,carryout,saidadefinitiva,s0);

		for( i=0; i<=7; i = i+1 )
		begin
			a = i;
			for ( j=0; j<=7; j = j+1 )
			begin
				#1 b = j;
			end
		end

	end

endmodule