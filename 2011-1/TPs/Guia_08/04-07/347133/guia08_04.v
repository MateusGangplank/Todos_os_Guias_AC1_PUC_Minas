//NOME: Henrique Carvalho Parreira
//MATRICULA: 347133

module metodoreduzirquinenand ( saida,a,b,c,d );

output saida;
input a,b,c,d;
wire temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10;

nand NAND1 (temp1,c,c);
nand NAND2 (temp2,a,c,d);
nand NAND3 (temp10,temp2,temp2);
nand NAND4 (temp3,a,a);
nand NAND5 (temp4,temp3,c);
nand NAND6 (temp5,temp4,temp4);
nand NAND7 (temp6,b,d);
nand NAND8 (temp7,temp6,temp6);
nand NAND9 (temp8,b,c);
nand NAND10 (temp9,temp8,temp8);
nand NAND11 (saida,temp10,temp5,temp7,temp9);

endmodule

module testguia8;
reg a,b,c,d;
wire saida;

metodoreduzirquinenand  REDUZIRQUINENAND ( saida,a,b,c,d );

initial begin:start
        a=0; b=0; c=0; d=0;
end

initial begin: main
#1 $display (" Circuito do exercicio 04-guia8 com portas NAND'S ");
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