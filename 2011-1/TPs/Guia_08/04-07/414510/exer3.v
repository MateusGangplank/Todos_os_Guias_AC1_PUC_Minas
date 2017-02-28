// Nome: Marley Ribeiro  
// Matrícula: 414510

module QuineMcCluskey ( s,a,b,c,d,e );

output s;
input a,b,c,d,e;
wire temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10,temp11;

not NOT1 (temp1,a);
not NOT2 (temp2,c);
not NOT3 (temp3,d);
and AND1 (temp4,temp1,temp2,temp3);
and AND2 (temp5,a,c,temp3);
not NOT5 (temp6,b);
and AND3 (temp7,temp6,e);
and AND4 (temp8,c,e);
not NOT6 (temp9,b);
not NOT7 (temp10,c);
and AND5 (temp11,a,temp9,temp10,d);
or OR1 (s,temp4,temp5,temp7,temp8,temp11);

endmodule
//-------------------------------------------------------------------------------------------------------------

module teste;
reg a,b,c,d,e;
wire s;

simplQM  QuineMcCluskey QM( s,a,b,c,d,e );

initial begin:start
        a=0; b=0; c=0; d=0; e=0;
end

initial begin: main
#1 $display (" Exer Guia 08 - Marley Ribeiro ");
#1 $display (" Tabela 16 Valores ");
#1 $display (" a   b   c   d   e =   s ");
  $monitor (" %b   %b   %b   %b   %b =   %b ",a,b,c,d,e,s);
           #1 a=0;  b=0;    c=0;   d=0;   e=1;
			  #1 a=0;  b=0;    c=0;   d=1;   e=0;
			  #1 a=0;  b=0;    c=0;   d=1;   e=1;
			  #1 a=0;  b=0;    c=1;   d=0;   e=0;
			  #1 a=0;  b=0;    c=1;   d=0;   e=1;
			  #1 a=0;  b=0;    c=1;   d=1;   e=0;
			  #1 a=0;  b=0;    c=1;   d=1;   e=1;
			  #1 a=0;  b=1;    c=0;   d=0;   e=0;
			  #1 a=0;  b=1;    c=0;   d=0;   e=1;
			  #1 a=0;  b=1;    c=0;   d=1;   e=0;
			  #1 a=0;  b=1;    c=0;   d=1;   e=1;
			  #1 a=0;  b=1;    c=1;   d=0;   e=0;
			  #1 a=0;  b=1;    c=1;   d=0;   e=1;
			  #1 a=0;  b=1;    c=1;   d=1;   e=0;
			  #1 a=0;  b=1;    c=1;   d=1;   e=1;
			  #1 a=1;  b=0;    c=0;   d=0;   e=0;
			  #1 a=1;  b=0;    c=0;   d=0;   e=1;
			  #1 a=1;  b=0;    c=0;   d=1;   e=0;
			  #1 a=1;  b=0;    c=0;   d=1;   e=1;
			  #1 a=1;  b=0;    c=1;   d=0;   e=0;
			  #1 a=1;  b=0;    c=1;   d=0;   e=1;
			  #1 a=1;  b=0;    c=1;   d=1;   e=0;
			  #1 a=1;  b=0;    c=1;   d=1;   e=1;
			  #1 a=1;  b=1;    c=0;   d=0;   e=0;
			  #1 a=1;  b=1;    c=0;   d=0;   e=1;
			  #1 a=1;  b=1;    c=0;   d=1;   e=0;
			  #1 a=1;  b=1;    c=0;   d=1;   e=1;
			  #1 a=1;  b=1;    c=1;   d=0;   e=0;
			  #1 a=1;  b=1;    c=1;   d=0;   e=1;
			  #1 a=1;  b=1;    c=1;   d=1;   e=0;
			  #1 a=1;  b=1;    c=1;   d=1;   e=1;
			  
			  
end
endmodule