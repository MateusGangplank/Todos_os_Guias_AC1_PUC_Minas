// Nome: Isabella Gonçales
// Matrícula: 420120

module metodoprovab ( saida,a,b,c,d );

output saida;
input a,b,c,d;
wire temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10,temp11,temp12;
wire temp13,temp14,temp15,temp16,temp17,temp18,temp19,temp20,temp21,temp22,temp23,temp24;

not NOT1 (temp1,a);
not NOT2 (temp2,b);
not NOT3 (temp3,c);
and AND1 (temp4,temp1,temp2,temp3,d);
not NOT4 (temp5,a);
not NOT5 (temp6,b);
not NOT6 (temp7,d);
and AND2 (temp8,temp5,temp6,c,temp7);
not NOT7 (temp9,a);
not NOT9 (temp10,c);
not NOT10(temp11,d);
and AND3 (temp12,temp9,b,temp10,temp11);
not NOT11(temp13,a);
and AND4 (temp14,temp13,b,c,d);
not NOT12(temp15,b);
not NOT13(temp16,c);
not NOT14(temp17,d);
and AND5 (temp18,a,temp15,temp16,temp17);
not NOT2 (temp19,b);
and AND6 (temp20,a,temp19,c,d);
not NOT2 (temp21,c);
and AND7 (temp22,a,b,temp21,d);
not NOT2 (temp23,d);
and AND8 (temp24,a,b,c,temp23);
nor NOR1 (saida,temp4,temp8,temp12,temp14,temp18,temp20,temp22,temp24);


endmodule
 
module testprova1;
reg a,b,c,d;
wire saida;

metodoprovab PROVAB ( saida,a,b,c,d );

initial begin:start
        a=0; b=0; c=0; d=0;
end

initial begin: main
#1 $display (" Circuito da questao b da prova ");
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
  
     Circuito da questao b da prova 
     a |  b |  c |  d  =  saida 
     0  | 0  | 0 |  0  =   1 
     0  | 0  | 0 |  1  =   0 
     0  | 0  | 1 |  0  =   0 
     0  | 0  | 1 |  1  =   1 
     0  | 1  | 0 |  0  =   0 
     0  | 1  | 0 |  1  =   1 
     0  | 1  | 1 |  0  =   1 
     0  | 1  | 1 |  1  =   0 
     1  | 0  | 0 |  0  =   0 
     1  | 0  | 0 |  1  =   1 
     1  | 0  | 1 |  0  =   1 
     1  | 0  | 1 |  1  =   0 
     1  | 1  | 0 |  0  =   1 
     1  | 1  | 0 |  1  =   0 
     1  | 1  | 1 |  0  =   0 
     1  | 1  | 1 |  1  =   1 
    
     ----jGRASP: operation complete.
    */