// Nome: Isabella Gonçales
// Matrícula: 420120


module metodomeiadiferenca(diferenca,sinal,e1,e2);
output diferenca,sinal;
input e1,e2;
wire temp1;

xor xor1 (diferenca,e1,e2);
not not1 (temp1,e1);
and and1 (sinal,temp1,e2);

endmodule


module metododiferencacompleta (diferenca,sinal,e1,e2,e3);
output diferenca,sinal;
input e1,e2,e3;
wire temp1,temp2,temp3;

metodomeiadiferenca MeiaDiferenca1 (temp1,temp2,e1,e2);
metodomeiadiferenca MeiaDiferenca2 (diferenca,temp3,e3,temp1);
or OR1 (sinal,temp2,temp3);


endmodule


module metodoDiferencacompleta4bits(diferenca,sinal,e1,e2);

output [2:0]diferenca;
output sinal;
input [2:0]e1,e2;
wire sinal1,sinal2;

metodomeiadiferenca MEIADIFERENCA (diferenca[0],sinal1,e1[0],e2[0]);
metododiferencacompleta DIFERENCACOMPLETA1 ( diferenca[1],sinal2,e1[1],e2[1],sinal1);
metododiferencacompleta DIFERENCACOMPLETA2 (diferenca[2],sinal,e1[2],e2[2],sinal2);

endmodule


module testsubtrator4bits;
reg [2:0]e1,e2;
wire [2:0]diferenca;
wire sinal;
integer i,j;

metodoDiferencacompleta4bits DiferencaCompleta(diferenca,sinal,e1,e2);

initial begin: start
		e1=0; e2=0;
end


	initial begin:main

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

endmodule


/* Registrando os resultado
Circuito Diferenca Completa com 3 bits 
     e1 - e2 = sinal  diferenca 
      000 -  000 = 0   000
      000 -  001 = 0   011
      000 -  010 = 0   110
      000 -  011 = 0   101
      000 -  100 = 1   100
      000 -  101 = 1   111
      000 -  110 = 1   010
      001 -  111 = 1   010
      001 -  000 = 0   001
      001 -  001 = 0   000
      001 -  010 = 0   111
      001 -  011 = 0   110
      001 -  100 = 1   101
      001 -  101 = 1   100
      001 -  110 = 1   011
      010 -  111 = 1   111
      010 -  000 = 0   110
      010 -  001 = 0   001
      010 -  010 = 0   000
      010 -  011 = 0   011
      010 -  100 = 1   010
      010 -  101 = 1   101
      010 -  110 = 1   100
      011 -  111 = 1   100
      011 -  000 = 0   111
      011 -  001 = 0   110
      011 -  010 = 0   001
      011 -  011 = 0   000
      011 -  100 = 1   011
      011 -  101 = 1   010
      011 -  110 = 1   101
      100 -  111 = 0   101
      100 -  000 = 1   100
      100 -  001 = 1   111
      100 -  010 = 0   010
      100 -  011 = 0   001
      100 -  100 = 0   000
      100 -  101 = 0   011
      100 -  110 = 0   110
      101 -  111 = 0   110
      101 -  000 = 1   101
      101 -  001 = 1   100
      101 -  010 = 0   011
      101 -  011 = 0   010
      101 -  100 = 0   001
      101 -  101 = 0   000
      101 -  110 = 0   111
      110 -  111 = 0   011
      110 -  000 = 0   010
      110 -  001 = 1   101
      110 -  010 = 1   100
      110 -  011 = 1   111
      110 -  100 = 0   110
      110 -  101 = 0   001
      110 -  110 = 0   000
      111 -  111 = 0   000
      111 -  000 = 0   011
      111 -  001 = 0   010
      111 -  010 = 1   101
      111 -  011 = 1   100
      111 -  100 = 0   111
      111 -  101 = 0   110
      111 -  110 = 0   001
      111 -  111 = 0   000
    
     ----jGRASP: operation complete.
    */

