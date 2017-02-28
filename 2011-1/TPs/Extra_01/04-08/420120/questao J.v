// Nome: Isabella Gonçales
// Matrícula: 420120

module metodoprovaj ( saida,a,b,c,d );

output saida;
input a,b,c,d;

and AND1 (saida,a,b,c,d);

endmodule
 
module testprova1;
reg a,b,c,d;
wire saida;

metodoprovaj PROVAJ ( saida,a,b,c,d );

initial begin:start
        a=0; b=0; c=0; d=0;
end

initial begin: main
#1 $display (" Circuito da questao j da prova ");
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
     
     Circuito da questao j da prova 
     a |  b |  c |  d  =  saida 
     0  | 0  | 0 |  0  =   0 
     0  | 0  | 0 |  1  =   0 
     0  | 0  | 1 |  0  =   0 
     0  | 0  | 1 |  1  =   0 
     0  | 1  | 0 |  0  =   0 
     0  | 1  | 0 |  1  =   0 
     0  | 1  | 1 |  0  =   0 
     0  | 1  | 1 |  1  =   0 
     1  | 0  | 0 |  0  =   0 
     1  | 0  | 0 |  1  =   0 
     1  | 0  | 1 |  0  =   0 
     1  | 0  | 1 |  1  =   0 
     1  | 1  | 0 |  0  =   0 
     1  | 1  | 0 |  1  =   0 
     1  | 1  | 1 |  0  =   0 
     1  | 1  | 1 |  1  =   1 
    
     ----jGRASP: operation complete.
                
                
 */