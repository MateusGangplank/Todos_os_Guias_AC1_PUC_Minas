// Nome: Isabella Gonçales
// Matrícula: 420120

module metodoprovac ( saida,a,b,c,d );

output saida;
input a,b,c,d;
wire temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10,temp11,temp12;
wire temp13,temp14,temp15,temp16,temp17,temp18,temp19,temp20;
wire temp21,temp22,temp23,temp24,temp25,temp26;

not NOT1 (temp1,a);
not NOT2 (temp2,b);
and AND1 (temp3,temp1,temp2,c,d);
not NOT3 (temp4,a);
not NOT4 (temp5,c);
and AND2 (temp6,temp4,b,temp5,d);
not NOT5 (temp7,a);
not NOT6 (temp8,d);
and AND3 (temp9,temp7,b,c,temp8);
not NOT7 (temp10,a);
and AND4 (temp11,temp10,b,c,d);
not NOT8 (temp12,b);
not NOT9 (temp13,c);
and AND5 (temp14,a,temp12,temp13,d);
not NOT10(temp15,b);
not NOT11(temp16,d);
and AND6 (temp17,a,temp15,c,temp16);
not NOT16(temp18,b);
and AND7 (temp19,a,temp18,c,d);
not NOT17(temp20,c);
not NOT18(temp21,d);
and AND8 (temp22,a,b,temp20,temp21);
not NOT19(temp23,c);
and AND5 (temp24,a,b,temp23,d);
not NOT20(temp25,d);
and AND9 (temp26,a,b,c,temp25);
nor NOR1 (saida,temp3,temp6,temp9,temp11,temp14,temp17,temp19,temp22,temp24,temp26);


endmodule
 
module testprova1;
reg a,b,c,d;
wire saida;

metodoprovac PROVAC ( saida,a,b,c,d );

initial begin:start
        a=0; b=0; c=0; d=0;
end

initial begin: main
#1 $display (" Circuito da questao c da prova ");
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
      
     Circuito da questao c da prova 
     a |  b |  c |  d  =  saida 
     0  | 0  | 0 |  0  =   1 
     0  | 0  | 0 |  1  =   1 
     0  | 0  | 1 |  0  =   1 
     0  | 0  | 1 |  1  =   0 
     0  | 1  | 0 |  0  =   1 
     0  | 1  | 0 |  1  =   0 
     0  | 1  | 1 |  0  =   0 
     0  | 1  | 1 |  1  =   0 
     1  | 0  | 0 |  0  =   1 
     1  | 0  | 0 |  1  =   0 
     1  | 0  | 1 |  0  =   0 
     1  | 0  | 1 |  1  =   0 
     1  | 1  | 0 |  0  =   0 
     1  | 1  | 0 |  1  =   0 
     1  | 1  | 1 |  0  =   0 
     1  | 1  | 1 |  1  =   1 
    
     ----jGRASP: operation complete.
    
         */