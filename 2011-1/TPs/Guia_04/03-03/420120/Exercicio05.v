// Nome: Isabella Gonçales
// Matrícula: 420120

module xornand (saida,e1,e2);
output saida;
input e1,e2;
wire temp1,temp2,temp3,temp4;

nand NAND3 (temp3,e1,e2);
nand NAND1 (temp1,e1,temp3);
nand NAND2 (temp2,e2,temp3);
nand NAND4 (saida,temp1,temp2);

endmodule

module andnand (saida,e1,e2);
output saida;
input e1,e2;
wire temp1;

nand NAND1 (temp1,e1,e2);
nand NAND2 (saida,temp1,temp1);

endmodule

module ornand (saida,e1,e2);
output saida;
input e1,e2;
wire temp1,temp2;

nand NAND1 (temp1,e1,e1);
nand NAND2 (temp2,e2,e2);
nand NAND3 (saida,temp1,temp2);

endmodule

module notnand (saida,e);
output saida;
input e;

nand NAND1 (saida,e,e);

endmodule


module metodomeiadiferenca (saida,sinal,e1,e2);
output saida,sinal;
input e1,e2;
wire temp1;

xornand XOR1 (saida,e1,e2);
notnand NOT1 (temp1,e1);
andnand AND1 (sinal,temp1,e2);

endmodule


module metododiferencacompleta (saida,sinal,e1,e2,vin);
output saida,sinal;
input e1,e2,vin;
wire temp1,temp2,temp3;


metodomeiadiferenca MeiaDiferenca1 (temp1,temp2,e1,e2);
metodomeiadiferenca MeiaDiferenca2 (saida,temp3,temp1,vin);
ornand OR1 (sinal,temp2,temp3);

endmodule

module testdiferencacompleta;
reg e1,e2,vin;
wire saida,sinal;

metododiferencacompleta DiferencaCompleta (saida,sinal,e1,e2,vin);

initial begin: start
		e1 = 0;  e2 = 0; vin=0;
		
end


initial begin:main

		$display("Circuito Diferenca Completa com portas NANDS ");
		#1 $display("e1 - e2 - vin = sinal  saida");
		#1 $monitor("%b  - %b  -  %b  =   %d      %d", e1,e2,vin,sinal,saida);

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
   
    Circuito Diferenca Completa com portas NANDS 
    e1 - e2 - vin = sinal  saida
    0  - 0  -  0  =   0      0
    0  - 0  -  1  =   1      1
    0  - 1  -  0  =   1      1
    0  - 1  -  1  =   1      0
    1  - 0  -  0  =   0      1
    1  - 0  -  1  =   0      0
    1  - 1  -  0  =   0      0
    1  - 1  -  1  =   1      1
    
     ----jGRASP: operation complete.
    
*/



