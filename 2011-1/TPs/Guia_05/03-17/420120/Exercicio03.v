// Nome: Isabella Gonçales
// Matrícula:420120


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

module metodoMultiplicador3bits(saidadefinitiva,s0,carryout,e1,e2);

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
reg [3:0]e1,e2;
wire [3:0]saidadefinitiva;
wire carryout;
integer i,j;
 

metodoMultiplicador3bits MULTIPLICADOR(saidadefinitiva,s0,carryout,e1,e2);

initial begin: start
		e1=0; e2=0;
end


	initial begin:main

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

endmodule
* registrando os resultados

  
    Circuito Multiplicador com 3 bits 
     e1 + e2 = carry   saida 
	  0000 + 0000 = 0    00000
     0000 + 0001 = 0    00000
     0000 + 0010 = 0    00000
     0000 + 0011 = 0    00000
     0000 + 0100 = 0    00000
     0000 + 0101 = 0    00000
     0000 + 0110 = 0    00000
     0001 + 0111 = 0    01011
     0001 + 0000 = 0    00000
     0001 + 0001 = 0    00001
     0001 + 0010 = 0    00010
     0001 + 0011 = 0    00011
     0001 + 0100 = 0    01000
     0001 + 0101 = 0    01001
     0001 + 0110 = 0    01010
     0010 + 0111 = 0    01010
     0010 + 0000 = 0    00000
     0010 + 0001 = 0    00010
     0010 + 0010 = 0    00100
     0010 + 0011 = 0    00110
     0010 + 0100 = 0    00100
     0010 + 0101 = 0    00110
     0010 + 0110 = 0    01000
     0011 + 0111 = 0    10101
     0011 + 0000 = 0    00000
     0011 + 0001 = 0    00011
     0011 + 0010 = 0    00110
     0011 + 0011 = 0    01001
     0011 + 0100 = 0    01100
     0011 + 0101 = 0    01111
     0011 + 0110 = 0    10010
     0100 + 0111 = 0    11010
     0100 + 0000 = 0    00000
     0100 + 0001 = 0    00000
     0100 + 0010 = 0    11000
     0100 + 0011 = 0    11000
     0100 + 0100 = 0    00010
     0100 + 0101 = 0    00010
     0100 + 0110 = 0    11010
     0101 + 0111 = 1    00101
     0101 + 0000 = 0    00000
     0101 + 0001 = 0    00001
     0101 + 0010 = 0    11010
     0101 + 0011 = 0    11011
     0101 + 0100 = 0    01010
     0101 + 0101 = 0    01011
     0101 + 0110 = 1    00100
     0110 + 0111 = 1    00100
     0110 + 0000 = 0    00000
     0110 + 0001 = 0    00010
     0110 + 0010 = 0    11100
     0110 + 0011 = 0    11110
     0110 + 0100 = 0    00110
     0110 + 0101 = 0    01000
     0110 + 0110 = 1    00010
     0111 + 0111 = 0    01111
     0111 + 0000 = 0    00000
     0111 + 0001 = 0    00011
     0111 + 0010 = 0    11110
     0111 + 0011 = 0    00001
     0111 + 0100 = 0    01110
     0111 + 0101 = 0    10001
     0111 + 0110 = 1    01100
     0111 + 0111 = 0    01111
    
     ----jGRASP: operation complete.
    */