// Nome: Raphaela Fernanda Silva
// Matrícula: 420141

module simplQM ( s,a,b,c,d );

output s;
input a,b,c,d;
wire s1,s2,s3,s4,s5,s6;

not NOT1 (s1,c);
not NOT2 (s3,a);
and AND1 (s2,a,s1,d);
and AND2 (s4,s3,c);
and AND3 (s5,b,d);
and AND4 (s6,b,c);
or OR1 (s,s2,s4,s5,s6);

endmodule

module testQM;
reg a,b,c,d;
wire s;

simplQM  QM ( s,a,b,c,d );

initial begin:start
        a=0; b=0; c=0; d=0;
end

initial begin: main
#1 $display (" Exercicio 01 - Guia08 ");
#1 $display (" a   b   c   d  =   s ");
  $monitor (" %b   %b   %b   %b  =   %b ",a,b,c,d,s);
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
