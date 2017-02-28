// Nome: Isabella Gonçales
// Matrícula: 420120

module metodoprovaf ( saida,a,b,c,d );

output saida;
input a,b,c,d;
wire temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10,temp11,temp12;
wire temp13,temp14,temp15,temp16;



not NOT1 (temp1,b);
not NOT2 (temp2,c);
and AND1 (temp3,temp1,temp2);
or OR1   (temp4,a,b);
and AND2 (temp5,temp3,temp4);
not NOT3 (temp6,a);
not NOT4 (temp7,d);
and AND3 (temp8,temp6,temp7);
or OR2   (temp9,b,c);
and AND4 (temp10,temp8,temp9);
and AND5 (temp11,c,d);
or OR3   (temp12,a,b);
and AND6 (temp13,temp11,temp12);
and AND7 (temp14,a,b);
or OR4   (temp15,c,d);
and AND8 (temp16,temp14,temp15);
or OR5   (saida,temp5,temp10,temp13,temp16);


endmodule
 
module testprova1;
reg a,b,c,d;
wire saida;

metodoprovaf PROVAF ( saida,a,b,c,d );

initial begin:start
        a=0; b=0; c=0; d=0;
end

initial begin: main
#1 $display (" Circuito da questao f da prova ");
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
     Circuito da questao f da prova 
     a  |  b |  c |  d  =  saida 
     0  | 0  | 0 |  0  =   0 
     0  | 0  | 0 |  1  =   0 
     0  | 0  | 1 |  0  =   1 
     0  | 0  | 1 |  1  =   0 
     0  | 1  | 0 |  0  =   1 
     0  | 1  | 0 |  1  =   0 
     0  | 1  | 1 |  0  =   1 
     0  | 1  | 1 |  1  =   1 
     1  | 0  | 0 |  0  =   1 
     1  | 0  | 0 |  1  =   1 
     1  | 0  | 1 |  0  =   0 
     1  | 0  | 1 |  1  =   1 
     1  | 1  | 0 |  0  =   0 
     1  | 1  | 0 |  1  =   1 
     1  | 1  | 1 |  0  =   1 
     1  | 1  | 1 |  1  =   1 
    
     ----jGRASP: operation complete.
       
 */