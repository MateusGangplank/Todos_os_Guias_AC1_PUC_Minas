module MEIADIFERENCANOR(diferenca,sinal,a,b);
input a,b;
output diferenca,sinal;
wire temp1,temp2,temp3,temp4,temp5,temp6,temp7;

nor NOR1 (temp1,a,b);
nor NOR2 (temp2,b,b);
nor NOR3 (temp3,temp1,temp2);
nor NOR4 (temp4,a,b);
nor NOR5 (diferenca,temp3,temp4);
nor NOR6 (temp5,b,b);
nor NOR7 (temp6,a,a);
nor NOR8 (temp7,temp6,temp6);
nor NOR9 (sinal,temp5,temp7);


 endmodule


module DIFERENCACOMPLETANOR(diferenca,sinal,a,b,c);

output diferenca,sinal;
input a,b,c;
wire temp1,temp2,temp3;

MEIADIFERENCANOR DIFERENCANOR1 (temp1,temp2,a,b);
MEIADIFERENCANOR DIFERENCANOR2 (diferenca,temp3,temp1,c);
nor NOR1 (temp4,temp2,temp3);
nor NOR2 (sinal,temp4,temp4);


 endmodule



module DIFERENCACOMPLETA3BITS(diferenca,sinal,a,b);

input [2:0]a,b;
output [2:0]diferenca;
output sinal;
wire temp1,temp2;

MEIADIFERENCANOR MEIADIFERENCA1 (diferenca[0],temp1,a[0],b[0]);
DIFERENCACOMPLETANOR DIFERENCACOMPLETA1 (diferenca[1],temp2,a[1],b[1],temp1);
DIFERENCACOMPLETANOR DIFERENCACOMPLETA2 (diferenca[2],sinal,a[2],b[2],temp2);


 endmodule

module TESTESUBTRATOR3BITS;
reg [2:0]a,b;
wire [2:0]diferenca;
wire sinal;
integer i,j;


DIFERENCACOMPLETA3BITS DIFERENCACOMPLETA1 (diferenca,sinal,a,b);

initial begin: start
		a=0; b=0;
end


	initial begin:main

		$display(" Larissa Fernandes Leijoto - 410476 ");
		#1 $display(" a | b = sinal | diferenca ");
		#1 $monitor(" %3b | %3b =   %b  | %3b", a,b,sinal,diferenca);

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