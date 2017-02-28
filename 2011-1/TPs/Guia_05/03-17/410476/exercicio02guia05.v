module MEIADIFERENCA(diferenca,sinal,a,b);
output diferenca,sinal;
input a,b;
wire temp1;

xor XOR1 (diferenca,a,b);
not NOT1 (temp1,a);
and AND1 (sinal,temp1,b);

 endmodule


module DIFERENCACOMPLETA (diferenca,sinal,a,b,c);
output diferenca,sinal;
input a,b,c;
wire temp1,temp2,temp3;

MEIADIFERENCA MEIADIFERENCA1(temp1,temp2,a,b);
MEIADIFERENCA MEIADIFERENCA2 (diferenca,temp3,c,temp1);
or OR1 (sinal,temp2,temp3);


 endmodule


module DIFERENCACOMPLETA3BITS(diferenca,sinal,a,b);

output [2:0]diferenca;
output sinal;
input [2:0]a,b;
wire sinal1,sinal2;

MEIADIFERENCA MEIADIFERENCA1 (diferenca[0],sinal1,a[0],b[0]);
DIFERENCACOMPLETA DIFERENCACOMPLETA1 ( diferenca[1],sinal2,a[1],b[1],sinal1);
DIFERENCACOMPLETA DIFERENCACOMPLETA2 (diferenca[2],sinal,a[2],b[2],sinal2);

 endmodule


module TESTESUBTRATOR;
reg [2:0]a,b;
wire [2:0]diferenca;
wire sinal;
integer i,j;

DIFERENCACOMPLETA3BITS DIFERENCACOMPLETA3BITS1(diferenca,sinal,a,b);

initial begin: start
		a=0; b=0;
end

	
initial begin:main

		#1 $display (" Larissa Fernandes Leijoto - 410476 ");
		#1 $display (" a | b | sinal | Diferenca");
		$monitor (" %b | %b |   %b       |  %b",a,b,sinal,diferenca);


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

