// Nome: Isabella Gonçales
// Matrícula: 420120

module metodomeiadiferenca (saida,vout,e1,e2);
output saida,vout;
input e1,e2;
wire temp1;

xor XOR1 (saida,e1,e2);
not NOT1 (temp1,e1);
and AND1 (vout,temp1,e2);

endmodule

module metododiferencacompleta (saida,vout,e1,e2,vin);
output saida,vout;
input e1,e2,vin;
wire temp1,temp2,temp3;

metodomeiadiferenca MeiaDiferenca1 (temp1,temp2,e1,e2);
metodomeiadiferenca MeiaDiferenca2 (saida,temp3,temp1,vin);
or OR1 (vout, temp2,temp3);

endmodule

module testdiferencacompleta;
reg e1,e2,vin;
wire diferenca,vout;

metododiferencacompleta DiferencaCompleta (diferenca,vout,e1,e2,vin);

initial begin: start
		e1 = 0;  e2 = 0; vin=0;
		
end


initial begin:main

		$display("Circuito Diferenca Completa");
		#1 $display("e1-e2-Vin= Vout diferenca");
		#1 $monitor("%b- %b- %b =   %b      %b", e1,e2,vin,vout,diferenca);

		#1 e1 = 0; e2 = 0; vin=1;
		#1 e1 = 0; e2 = 1; vin=0;
		#1 e1 = 0; e2 = 1; vin=1;
		#1 e1 = 1; e2 = 0; vin=0;
		#1 e1 = 1; e2 = 0; vin=1;
		#1 e1 = 1; e2 = 1; vin=0;
		#1 e1 = 1; e2 = 1; vin=1;



end

endmodule


/*
 Circuito Diferenÿa Completa
    e1-e2-Vin= Vout diferenca
    0- 0- 0 =   0      0
    0- 0- 1 =   1      1
    0- 1- 0 =   1      1
    0- 1- 1 =   1      0
    1- 0- 0 =   0      1
    1- 0- 1 =   0      0
    1- 1- 0 =   0      0
    1- 1- 1 =   1      1
    
     ----jGRASP: operation complete.
       
*/

