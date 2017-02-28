// Nome: Marley Ribeiro
// Matrícula: 414510

module  QuineMcCluskey( s,a,b,c,d );

output s;
input a,b,c,d;
wire temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8;

not NOT1 (temp1,b);
not NOT2 (temp2,d);
and AND1 (temp3,temp1,temp2);
and AND2 (temp4,a,d);
and AND3 (temp5,a,b,d);
not NOT3 (temp6,b);
not NOT4 (temp7,c);
and AND4 (temp8,a,temp6,temp7);
or OR1 (s,temp3,temp4,temp5,temp8);

endmodule

//------------------------------------------------------------------------------------------------------------------

module teste;
reg a,b,c,d;
wire s;

QuineMcCluskey  QM ( s,a,b,c,d );

initial begin:start
        a=0; b=0; c=0; d=0;
end

initial begin: main
#1 $display (" Exer Guia 08 - Marley Ribeiro ");
#1 $display (" a   b   c   d  =   s ");
  $monitor (" %b   %b   %b   %b  =   %b ",a,b,c,d,s);
           
			  #1 a=1;    b=0;   c=0;   d=0;
			  #1 a=1;    b=0;   c=0;   d=1;
			  #1 a=1;    b=0;   c=1;   d=0;
			  #1 a=1;    b=0;   c=1;   d=1;
			  #1 a=1;    b=1;   c=0;   d=0;
			  #1 a=1;    b=1;   c=0;   d=1;
			  #1 a=1;    b=1;   c=1;   d=0;
			  #1 a=1;    b=1;   c=1;   d=1;
			  #1 a=0;    b=0;   c=0;   d=1;
			  #1 a=0;    b=0;   c=1;   d=0;
			  #1 a=0;    b=0;   c=1;   d=1;
			  #1 a=0;    b=1;   c=0;   d=0;
			  #1 a=0;    b=1;   c=0;   d=1;
			  #1 a=0;    b=1;   c=1;   d=0;
			  #1 a=0;    b=1;   c=1;   d=1;
			  
			  
			  
end
endmodule