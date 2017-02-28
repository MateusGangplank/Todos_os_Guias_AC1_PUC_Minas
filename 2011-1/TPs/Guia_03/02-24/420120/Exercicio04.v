// Nome: Isabella Gonçales
// Matrícula: 420120

module metodomeiasomanor ( carry,saida,e1,e2 );

output carry,saida;
input e1,e2;
wire temp1,temp2,temp3;

nor NOR1 ( temp1,e1,e2 );
nor NOR2 ( temp2,e1,e1 );
nor NOR3 ( temp3,e2,e2 );
nor NOR4 ( carry,temp2,temp3 );
nor NOR5 ( saida,temp1,carry);

endmodule


module testmeiasomanor;
reg e1,e2;
wire carry,saida;


metodomeiasomanor meiasoma ( carry,saida,e1,e2 );

initial begin: start
        e1=0;  e2=0;
end

initial begin: main

#1 $display (" Circuito meia diferença com portas NOR ");
#1 $display (" e1 + e2 = carry   saida ");
   $monitor (" %b  + %b  =   %b      %b  ", e1,e2,carry,saida);
	#1  e1=0;  e2=1;
	#1  e1=1;  e2=0;
	#1  e1=1;  e2=1;
	
	
end
endmodule



/* Registrando os Resultados

 Circuito meia diferença com portas NOR 
     e1 + e2 = carry   saida 
     0  + 0  =   0      0  
     0  + 1  =   0      1  
     1  + 0  =   0      1  
     1  + 1  =   1      0  
    
     ----jGRASP: operation complete.
 */
