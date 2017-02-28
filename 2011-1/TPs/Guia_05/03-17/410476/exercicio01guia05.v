module MEIASOMA(saida,carry,a,b);
input a,b;
output saida,carry;


xor xor1 (saida,a,b);
and and1 (carry,a,b);

endmodule


module SOMACOMPLETA (soma,carryout,a,b,carryin);
input a,b,carryin;
output soma,carryout;
wire temp2;

MEIASOMA MeiaSoma1 (saida,carry,a,b);
MEIASOMA MeiaSoma2 (soma,temp2,saida,carryin);
or OR1 (carryout,temp2,carry);


 endmodule
 
 
module SOMADOR4BITS(saida,carryout,a,b);

input [3:0]a,b;
output [3:0]saida;
output carryout;
wire carryout1,carryout2,carryout3;

MEIASOMA MEIASOMA1 (saida[0],carryout1,a[0],b[0]);
SOMACOMPLETA SOMACOMPLETA1 (saida[1],carryout2,a[1],b[1],carryout1);
SOMACOMPLETA SOMACOMPLETA2 (saida[2],carryout3,a[2],b[2],carryout2);
SOMACOMPLETA SOMACOMPLETA3 (saida[3],carryout,a[3],b[3],carryout3);

endmodule


module TESTESOMADOR4BITS;
reg [3:0]a,b;
wire [3:0]saida;
wire carry;
integer i,j;

SOMADOR4BITS SOMADOR4BITS1(saida,carry,a,b);

initial begin: start
		a=0; b=0;
end


	initial begin:main

		#1 $display (" Larissa Fernandes Leijoto - 410476 ");
		#1 $display (" a | b | carry | saida");
		$monitor (" %b | %b |   %b       |  %b",a,b,carry,saida);


		for( i=0; i<=15; i = i+1 )
		begin
			a = i;
			for ( j=0; j<=15; j = j+1 )
			begin
				#1 b = j;
			end
		end

	end
     endmodule



