// Nome: Isabella Gonçales
// Matricula: 420120


module metodomeiadiferencanor ( sinal,saida,e1,e2 );

output sinal,saida;
input e1,e2;
wire temp1,temp2,temp3,temp4,temp5;

nor NOR1 ( temp1,e2,e2 ); 
nor NOR2 ( temp2,e1,e1 );
nor NOR3 ( temp3,temp1,temp2 );
nor NOR4 ( temp4,e1,e2 );
nor NOR5 ( saida,temp3,temp4 );
nor NOR6 ( temp5,e2,e2 );
nor NOR7 ( sinal,e1,temp5 );

endmodule


module testmeiadiferencanor;
reg e1,e2;
wire sinal,saida;

metodomeiadiferencanor meiadiferenca ( sinal,saida,e1,e2 );

initial begin: start
        e1=0;  e2=0;
		  
end

initial begin: main

#1 $display (" Circuito da meia-diferença com portas NOR ");
#1 $display (" e1 - e2 = sinal   saida ");
   $monitor (" %b  - %b  =   %b      %b",e1,e2,sinal,saida );
	#1  e1=0;  e2=1;
	#1  e1=1;  e2=0;
	#1  e1=1;  e2=1;
	
	
end
endmodule


/* Registrando os Resultados

 Circuito da meia-diferença com portas NOR 
     e1 - e2 = sinal   saida 
     0  - 0  =   0      0
     0  - 1  =   1      1
     1  - 0  =   0      1
     1  - 1  =   0      0
    
     ----jGRASP: operation complete.
 */
