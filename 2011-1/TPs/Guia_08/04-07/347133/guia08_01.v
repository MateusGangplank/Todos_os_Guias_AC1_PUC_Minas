//NOME: Henrique Carvalho Parreira
//MATRICULA: 347133

module metodoreduzirquine ( saida,a,b,c,d );

output saida;
input a,b,c,d;
wire temp1,temp2,temp3,temp4,temp5,temp6;

not NOT1 (temp1,c);
not NOT2 (temp3,a);
and AND1 (temp2,a,temp1,d);
and AND2 (temp4,temp3,c);
and AND3 (temp5,b,d);
and AND4 (temp6,b,c);
or OR1 (saida,temp2,temp4,temp5,temp6);

endmodule

module testguia8;
reg a,b,c,d;
wire saida;

metodoreduzirquine  REDUZIRQUINE ( saida,a,b,c,d );

initial begin:start
        a=0; b=0; c=0; d=0;
end

initial begin: main
#1 $display (" Circuito do exercicio 01-guia8 ");
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

