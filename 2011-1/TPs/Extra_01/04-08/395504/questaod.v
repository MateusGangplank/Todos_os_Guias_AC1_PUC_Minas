// Nome: Thaise Souto Martins
// Matrícula: 395504

module metodoprovad ( saida,a,b,c,d );

output saida;
input a,b,c,d;
wire temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10,temp11,temp12;
wire temp13,temp14,temp15,temp16,temp17,temp18,temp19,temp20;
wire temp21,temp22,temp23,temp24;

or OR1   (temp1,a,b,c,d);
not NOT1 (temp2,c);
not NOT2 (temp3,d);
or  OR2  (temp4,a,c,temp2,temp3);
not NOT3 (temp5,b);
not NOT4 (temp6,d);
or OR3   (temp7,a,temp5,c,temp6);
not NOT5 (temp8,b);
not NOT6 (temp9,c);
or OR4   (temp10,a,temp8,temp9,d);
not NOT7 (temp11,a);
not NOT8 (temp12,d);
or OR5   (temp13,temp11,b,c,temp12);
not NOT9 (temp14,a);
not NOT10(temp15,c);
or OR6   (temp16,temp14,b,temp15,d);
not NOT11(temp17,a);
not NOT12(temp18,b);
or OR7   (temp19,temp17,temp18,c,d);
not NOT13(temp20,a);
not NOT14(temp21,b);
not NOT15(temp22,c);
not NOT16(temp23,d);
or OR8   (temp24,temp20,temp21,temp22,temp23);
and AND1 (saida,temp1,temp4,temp7,temp10,temp13,temp16,temp19,temp24);

endmodule
 
module testprova1;
reg a,b,c,d;
wire saida;

metodoprovad PROVAD ( saida,a,b,c,d );

initial begin:start
        a=0; b=0; c=0; d=0;
end

initial begin: main
#1 $display (" Circuito da questao d da prova ");
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
    
     Circuito da questao d da prova 
     a |  b |  c |  d  =  saida 
     0  | 0  | 0 |  0  =   0 
     0  | 0  | 0 |  1  =   1 
     0  | 0  | 1 |  0  =   1 
     0  | 0  | 1 |  1  =   1 
     0  | 1  | 0 |  0  =   1 
     0  | 1  | 0 |  1  =   0 
     0  | 1  | 1 |  0  =   0 
     0  | 1  | 1 |  1  =   1 
     1  | 0  | 0 |  0  =   1 
     1  | 0  | 0 |  1  =   0 
     1  | 0  | 1 |  0  =   0 
     1  | 0  | 1 |  1  =   1 
     1  | 1  | 0 |  0  =   0 
     1  | 1  | 0 |  1  =   1 
     1  | 1  | 1 |  0  =   1 
     1  | 1  | 1 |  1  =   0 
    
     ----jGRASP: operation complete.
    
         */