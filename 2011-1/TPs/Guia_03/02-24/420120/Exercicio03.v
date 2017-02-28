// Nome: Isabella Gonçales
// Matrícula: 420120

module metodomeiadiferencanand ( sinal,saida,e1,e2 );

output sinal,saida;
input e1,e2;
wire temp1,temp2,temp3,temp4,temp5;

nand NAND1 ( temp1,e1,e2 );
nand NAND2 ( temp2,e1,temp1 );
nand NAND3 ( temp3,e2,temp1 );
nand NAND4 ( saida,temp2,temp3 );
nand NAND5 ( temp4,e1,e1 );
nand NAND6 ( temp5,e2,temp4 );
nand NAND7 ( sinal,temp5,temp5 );

endmodule


module testmeiadiferencanand;
reg e1,e2;
wire saida,sinal;

metodomeiadiferencanand meiadiferenca ( sinal,saida,e1,e2 );

initial begin: start
        e1=0; e2=0;
		  
end

initial begin: main

#1 $display (" Circuito da meia soma com portas NAND ");
#1 $display (" e1 - e2  =  sinal  saida ");
   $monitor (" %b  -  %b  =    %b      %b",e1,e2,sinal,saida );
	   #1  e1=0;  e2=1;
		#1  e1=1;  e2=0;
		#1  e1=1;  e2=1;		
		
end
endmodule



/* Registrando os Resultados

   
     Circuito da meia soma com portas NAND 
     e1 - e2  =  sinal  saida 
     0  -  0  =    0      0
     0  -  1  =    1      1
     1  -  0  =    0      1
     1  -  1  =    0      0
    
     ----jGRASP: operation complete.
 */