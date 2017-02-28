//NOME: Henrique Carvalho Parreira
//MATRICULA: 347133

module metodoreduzirquinenor ( saida,a,b,c,d );

output saida;
input a,b,c,d;
wire temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9;
wire temp10,temp11,temp12,temp13,temp14,temp15,temp16,temp17;


nor NOR1 (temp1,b,b);
nor NOR2 (temp2,d,d);
nor NOR3 (temp3,temp1,temp1);
nor NOR4 (temp4,temp2,temp2);
nor NOR5 (temp5,temp3,temp4);
nor NOR6 (temp6,a,a);
nor NOR7 (temp7,d,d);
nor NOR8 (temp8,temp6,temp7);
nor NOR9 (temp9,a,a);
nor NOR10 (temp10,d,d);
nor NOR11 (temp11,temp9,b,temp10);
nor NOR12 (temp12,a,a);
nor NOR13 (temp13,b,b);
nor NOR14 (temp14,c,c);
nor NOR15 (temp15,temp14,temp14);
nor NOR16 (temp16,temp12,temp13,temp15);
nor NOR17 (temp17,temp5,temp8,temp11,temp16);
nor NOR18 (saida,temp17,temp17);

endmodule

module testguia8;
reg a,b,c,d;
wire saida;

metodoreduzirquinenor  REDUZIRQUINENOR ( saida,a,b,c,d );

initial begin:start
        a=0; b=0; c=0; d=0;
end

initial begin: main
#1 $display (" Circuito do exercicio 05-guia8 com portas NOR ");
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

