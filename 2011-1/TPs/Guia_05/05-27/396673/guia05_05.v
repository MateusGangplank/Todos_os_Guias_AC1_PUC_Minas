// ---------------------
// Guia 05_05 - Diferen�a-completa de valores bin�rios com tr�s bits cada
// Nome: Anderson Belchior de Carvalho
// Matricula: 396673
// ---------------------

module meiadiferencanand(diferenca,sinal,e1,e2);
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


module somacompletanand(diferenca,sinal,e1,e2,e3);

output diferenca,sinal;
input e1,e2,e3;
wire temp1,temp2,temp3;

meiadiferencanand DIFERENCANOR1 (temp1,temp2,e1,e2);
meiadiferencanand DIFERENCANOR2 (diferenca,temp3,temp1,e3);
nor NOR1 (temp4,temp2,temp3);
nor NOR2 (sinal,temp4,temp4);

endmodule


module diferencacompleta3bits(diferenca,sinal,e1,e2);

output [2:0]diferenca;
output sinal;
input [2:0]e1,e2;
wire sinal1,sinal2;

meiadiferencanand MEIADIFERENCA1 (diferenca[0],sinal1,e1[0],e2[0]);
somacompletanand DIFERENCACOMPLETA2 (diferenca[1],sinal2,e1[1],e2[1],sinal1);
somacompletanand DIFERENCACOMPLETA3 (diferenca[2],sinal,e1[2],e2[2],sinal2);

endmodule


module testsubtrator3bits;
reg [2:0]e1,e2;
wire [2:0]diferenca;
wire sinal;
integer i,j;

diferencacompleta3bits SOMACOMPLETA1 (diferenca,sinal,e1,e2);

initial begin: start
		e1=0; e2=0;
end

	initial begin:main
      $display("\nguia05_05 - Anderson Belchior de Carvalho - 396673\n");
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

endmodule //fim guia05_05