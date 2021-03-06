// ---------------------
// Guia 05_02 - Diferen�a completa de dois valores bin�rios com tr�s bits cada
// Nome: Anderson Belchior de Carvalho
// Matricula: 396673
// ---------------------


module meiadiferenca(diferenca,sinal,e1,e2);
output diferenca,sinal;
input e1,e2;
wire temp1;

xor xor1 (diferenca,e1,e2);
not not1 (temp1,e1);
and and1 (sinal,temp1,e2);

endmodule


module diferencacompleta (diferenca,sinal,e1,e2,e3);
output diferenca,sinal;
input e1,e2,e3;
wire temp1,temp2,temp3;

meiadiferenca MeiaDiferenca1 (temp1,temp2,e1,e2);
meiadiferenca MeiaDiferenca2 (diferenca,temp3,e3,temp1);
or OR1 (sinal,temp2,temp3);


endmodule


module diferencacompleta4bits(diferenca,sinal,e1,e2);

output [2:0]diferenca;
output sinal;
input [2:0]e1,e2;
wire sinal1,sinal2;

meiadiferenca MEIADIFERENCA (diferenca[0],sinal1,e1[0],e2[0]);
diferencacompleta DIFERENCACOMPLETA1 ( diferenca[1],sinal2,e1[1],e2[1],sinal1);
diferencacompleta DIFERENCACOMPLETA2 (diferenca[2],sinal,e1[2],e2[2],sinal2);

endmodule


module testsubtrator4bits;
reg [2:0]e1,e2;
wire [2:0]diferenca;
wire sinal;
integer i,j;

diferencacompleta4bits DiferencaCompleta(diferenca,sinal,e1,e2);

initial begin: start
		e1=0; e2=0;
end


	initial begin:main
	
      $display("\nguia05_02 - Anderson Belchior de Carvalho - 396673\n");
		$display("Circuito Diferenca Completa com 3 bits ");
		#1 $display(" e1 - e2 = sinal  diferenca ");
		#1 $monitor(" %4b - %4b = %b  %4b", e1,e2,sinal,diferenca);

		for( i=0; i<=7; i = i+1 )
		begin
			e1 = i;
			for ( j=0; j<=7; j = j+1 )
			begin
				#1 e2 = j;
			end
		end

	end

endmodule //fim guia05_02
