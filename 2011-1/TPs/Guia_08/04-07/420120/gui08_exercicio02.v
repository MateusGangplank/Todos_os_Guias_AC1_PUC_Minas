// Nome: Isabella Gonçales
// Matrícula: 420120

module metodoreduzirquine ( saida,a,b,c,d );

output saida;
input a,b,c,d;
wire temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8;

not NOT1 (temp1,b);
not NOT2 (temp2,d);
and AND1 (temp3,temp1,temp2);
and AND2 (temp4,a,d);
and AND3 (temp5,a,b,d);
not NOT3 (temp6,b);
not NOT4 (temp7,c);
and AND4 (temp8,a,temp6,temp7);
or OR1 (saida,temp3,temp4,temp5,temp8);

endmodule

module testguia8;
reg a,b,c,d;
wire saida;

metodoreduzirquine  REDUZIRQUINE ( saida,a,b,c,d );

initial begin:start
        a=0; b=0; c=0; d=0;
end

initial begin: main
#1 $display (" Circuito do exercicio 02-guia8 ");
#1 $display (" a |  b |  c |  d  =  saida ");
  $monitor (" %b  | %b  | %b |  %b  =   %b ",a,b,c,d,saida);
           #1 a=0;    b=0;   c=0;   d=1;
			  #1 a=0;    b=0;   c=1;   d=0;
			  #1 a=0;    b=0;   c=1;   d=1;
			  #1 a=0;    b=1;   c=0;   d=0;
			  #1 a=0;    b=1;   c=0;   d=1;
			  #1 a=0;    b=1;   c=1;   d=0;
			  #1 a=0;    b=1;   c=1;   d=1;
			  #1 a=1;    b=0;   c=0;   d=0;
			  #1 a=1;    b=0;   c=0;   d=1;
			  #1 a=1;    b=0;   c=1;   d=0;
			  #1 a=1;    b=0;   c=1;   d=1;
			  #1 a=1;    b=1;   c=0;   d=0;
			  #1 a=1;    b=1;   c=0;   d=1;
			  #1 a=1;    b=1;   c=1;   d=0;
			  #1 a=1;    b=1;   c=1;   d=1;
			  
			  
			  
end
endmodule

/* registrando os resultados
    Circuito do exercicio 02-guia8 
     a |  b |  c |  d  =  saida 
     0  | 0  | 0 |  0  =   1 
     0  | 0  | 0 |  1  =   0 
     0  | 0  | 1 |  0  =   1 
     0  | 0  | 1 |  1  =   0 
     0  | 1  | 0 |  0  =   0 
     0  | 1  | 0 |  1  =   0 
     0  | 1  | 1 |  0  =   0 
     0  | 1  | 1 |  1  =   0 
     1  | 0  | 0 |  0  =   1 
     1  | 0  | 0 |  1  =   1 
     1  | 0  | 1 |  0  =   1 
     1  | 0  | 1 |  1  =   1 
     1  | 1  | 0 |  0  =   0 
     1  | 1  | 0 |  1  =   1 
     1  | 1  | 1 |  0  =   0 
     1  | 1  | 1 |  1  =   1 
    
     ----jGRASP: operation complete.
    */

