// Nome: Isabella Gonçales
// Matrícula: 420120

module metodomeiadiferencanand(diferenca,sinal,e1,e2);
output diferenca,sinal;
input e1,e2;
wire temp1,temp2,temp3,temp4,temp5,temp6,temp7;

nor NOR1 (temp1,e1,e2);
nor NOR2 (temp2,e2,e2);
nor NOR3 (temp3,temp1,temp2);
nor NOR4 (temp4,e1,e2);
nor NOR5 (diferenca,temp3,temp4);
nor NOR6 (temp5,e2,e2);
nor NOR7 (temp6,e1,e1);
nor NOR8 (temp7,temp6,temp6);
nor NOR9 (sinal,temp5,temp7);


endmodule


module metodosomacompletanand(diferenca,sinal,e1,e2,e3);

output diferenca,sinal;
input e1,e2,e3;
wire temp1,temp2,temp3;

metodomeiadiferencanand DIFERENCANOR1 (temp1,temp2,e1,e2);
metodomeiadiferencanand DIFERENCANOR2 (diferenca,temp3,temp1,e3);
nor NOR1 (temp4,temp2,temp3);
nor NOR2 (sinal,temp4,temp4);


endmodule



module metododiferencacompleta3bits(diferenca,sinal,e1,e2);

output [2:0]diferenca;
output sinal;
input [2:0]e1,e2;
wire sinal1,sinal2;

metodomeiadiferencanand MEIADIFERENCA1 (diferenca[0],sinal1,e1[0],e2[0]);
metodosomacompletanand DIFERENCACOMPLETA2 (diferenca[1],sinal2,e1[1],e2[1],sinal1);
metodosomacompletanand DIFERENCACOMPLETA3 (diferenca[2],sinal,e1[2],e2[2],sinal2);


endmodule

module testsubtrator3bits;
reg [2:0]e1,e2;
wire [2:0]diferenca;
wire sinal;
integer i,j;


metododiferencacompleta3bits SOMACOMPLETA1 (diferenca,sinal,e1,e2);

initial begin: start
		e1=0; e2=0;
end


	initial begin:main

		$display("Circuito Diferenca Completa com 3 bits ");
		#1 $display(" e1 -     e2 = sinal  diferenca ");
		#1 $monitor(" %3b - %3b =   %b    %3b", e1,e2,sinal,diferenca);

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


/* Registrano os resultados

   
    Circuito Diferenca Completa com 3 bits 
     e1 -     e2 = sinal  diferenca 
     000 - 000 =   0    000
     000 - 001 =   1    000
     000 - 010 =   1    000
     000 - 011 =   1    000
     000 - 100 =   1    000
     000 - 101 =   1    000
     000 - 110 =   1    000
     001 - 111 =   1    000
     001 - 000 =   0    001
     001 - 001 =   0    000
     001 - 010 =   1    001
     001 - 011 =   1    000
     001 - 100 =   1    001
     001 - 101 =   1    000
     001 - 110 =   1    001
     010 - 111 =   1    000
     010 - 000 =   0    010
     010 - 001 =   0    000
     010 - 010 =   0    000
     010 - 011 =   1    000
     010 - 100 =   1    010
     010 - 101 =   1    000
     010 - 110 =   1    000
     011 - 111 =   1    000
     011 - 000 =   0    011
     011 - 001 =   0    010
     011 - 010 =   0    001
     011 - 011 =   0    000
     011 - 100 =   1    011
     011 - 101 =   1    010
     011 - 110 =   1    001
     100 - 111 =   1    000
     100 - 000 =   0    100
     100 - 001 =   0    000
     100 - 010 =   0    000
     100 - 011 =   0    000
     100 - 100 =   0    000
     100 - 101 =   1    000
     100 - 110 =   1    000
     101 - 111 =   1    000
     101 - 000 =   0    101
     101 - 001 =   0    100
     101 - 010 =   0    001
     101 - 011 =   0    000
     101 - 100 =   0    001
     101 - 101 =   0    000
     101 - 110 =   1    001
     110 - 111 =   1    000
     110 - 000 =   0    110
     110 - 001 =   0    100
     110 - 010 =   0    100
     110 - 011 =   0    000
     110 - 100 =   0    010
     110 - 101 =   0    000
     110 - 110 =   0    000
     111 - 111 =   0    000
     111 - 000 =   0    111
     111 - 001 =   0    110
     111 - 010 =   0    101
     111 - 011 =   0    100
     111 - 100 =   0    011
     111 - 101 =   0    010
     111 - 110 =   0    001
     111 - 111 =   0    000
    
     ----jGRASP: operation complete.
    
*/
