// Nome: Thaise Souto Martins
// Matrícula: 395504

module metodoprovag ( saida,a,b,c,d );

output saida;
input a,b,c,d;
wire temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10,temp11,temp12;


not NOT1 (temp1,b);
and AND1 (temp2,temp1,b,c);
not NOT2 (temp3,c);
and AND2 (temp4,b,temp3,d);
not NOT3 (temp5,a);
and AND3 (temp6,temp5,b,c);
not NOT4 (temp7,b);
and AND4 (temp8,a,temp7,d);
not NOT5 (temp9,b);
and AND5 (temp10,a,temp9,c);
not NOT6 (temp11,d);
and AND6 (temp12,a,b,temp11);
or OR1   (saida,temp2,temp4,temp6,temp8,temp10,temp12);

endmodule
 
module testprova1;
reg a,b,c,d;
wire saida;

metodoprovag PROVAG ( saida,a,b,c,d );

initial begin:start
        a=0; b=0; c=0; d=0;
end

initial begin: main
#1 $display (" Circuito da questao g da prova ");
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
       
     Circuito da questao g da prova 
     a |  b |  c |  d  =  saida 
     0  | 0  | 0 |  0  =   0 
     0  | 0  | 0 |  1  =   0 
     0  | 0  | 1 |  0  =   0 
     0  | 0  | 1 |  1  =   0 
     0  | 1  | 0 |  0  =   0 
     0  | 1  | 0 |  1  =   1 
     0  | 1  | 1 |  0  =   1 
     0  | 1  | 1 |  1  =   1 
     1  | 0  | 0 |  0  =   0 
     1  | 0  | 0 |  1  =   1 
     1  | 0  | 1 |  0  =   1 
     1  | 0  | 1 |  1  =   1 
     1  | 1  | 0 |  0  =   1 
     1  | 1  | 0 |  1  =   1 
     1  | 1  | 1 |  0  =   1 
     1  | 1  | 1 |  1  =   0 
    
     ----jGRASP: operation complete.
            
 */