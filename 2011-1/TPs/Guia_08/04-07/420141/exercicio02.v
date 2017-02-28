// Nome: Raphaela Fernanda Silva
// Matrícula: 420141

module simplQM ( s,a,b,c,d );

output s;
input a,b,c,d;
wire s1,s2,s3,s4,s5,s6,s7,s8;

not NOT1 (s1,b);
not NOT2 (s2,d);
and AND1 (s3,s1,s2);
and AND2 (s4,a,d);
and AND3 (s5,a,b,d);
not NOT3 (s6,b);
not NOT4 (s7,c);
and AND4 (s8,a,s6,s7);
or OR1 (s,s3,s4,s5,s8);

endmodule

module testQM;
reg a,b,c,d;
wire s;

simplQM  QM ( s,a,b,c,d );

initial begin:start
        a=0; b=0; c=0; d=0;
end

initial begin: main
#1 $display (" Exercicio 02 - Guia08 ");
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