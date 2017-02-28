// Nome: Caio Ragacci Pimentel
// Matrícula: 405794

module metodoprovae ( saida,a,b,c,d );

output saida;
input a,b,c,d;
wire temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10,temp11,temp12;
wire temp13,temp14,temp15,temp16,temp17,temp18,temp19,temp20;
wire temp21,temp22,temp23,temp24;


not NOT1 (temp1,a);
not NOT2 (temp2,b);
not NOT3 (temp3,c);
and AND1 (temp4,temp1,temp2,temp3,d);
not NOT4 (temp5,a);
not NOT5 (temp6,b);
not NOT6 (temp7,d);
and AND2 (temp8,temp5,temp6,c,temp7);
not NOT7 (temp9,a);
not NOT8 (temp10,c);
not NOT9 (temp11,d);
and AND3 (temp12,temp9,b,temp10,temp11);
not NOT10(temp13,a);
and AND4 (temp14,temp13,b,c,d);
not NOT11(temp15,b);
not NOT12(temp16,c);
not NOT13(temp17,d);
and AND5 (temp18,a,temp15,temp16,temp17);
not NOT14(temp19,b);
and AND6 (temp20,a,temp19,c,d);
not NOT15(temp21,c);
and AND7 (temp22,a,b,temp21,d);
not NOT16(temp23,d);
and AND8 (temp24,a,b,c,temp23);
or OR1   (saida,temp4,temp8,temp12,temp14,temp18,temp20,temp22,temp24);

endmodule
 
module testprova1;
reg a,b,c,d;
wire saida;

metodoprovae PROVAE ( saida,a,b,c,d );

initial begin:start
        a=0; b=0; c=0; d=0;
end

initial begin: main
#1 $display (" Circuito da questao e da prova ");
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