// Nome: Isabella Gonçales
// Matrícula: 420120

module metodomeiasoma ( carry,saida,e1,e2 );

output carry,saida;
input e1,e2;
wire temp1,temp2;

or OR1 ( temp1,e1,e2 );
and AND1 ( carry,e1,e2 );
not NOT1 ( temp2,carry );
and AND2 ( saida,temp1,temp2 );

endmodule

module testmeiasoma;
reg e1,e2;
wire carry,saida;

metodomeiasoma meiasoma ( carry,saida,e1,e2 );

initial begin:start
        e1=0; e2=0;
end

initial begin: main
#1 $display (" Circuito Tradicional ");
#1 $display (" e1 + e2 =  carry  saida ");
  $monitor (" %b  + %b  = %b    %b ",e1,e2,carry,saida);
           #1 e1=0;    e2=1;
			  #1 e1=1;    e2=0;
			  #1 e1=1;    e2=1;
			  
end
endmodule




/* Registrando os Resultados

  Circuito Tradicional 
     e1 + e2 = s | carry 
     0  + 0  = 0    0 
     0  + 1  = 1    0 
     1  + 0  = 1    0 
     1  + 1  = 0    1 
    
     ----jGRASP: operation complete.
 */
