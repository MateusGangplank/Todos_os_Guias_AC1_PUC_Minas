// Giselle Caroline Vieira
// Matricula: 424649
// Guia 08
module Karnaugh (s,a,b,c,d,e);
output s;
input a,b,c,d,e;
wire t1,t2,t3,t4,t5;


and AND1(t1,~a,~c,~d);
and AND2(t2,a,c,~d);
and AND3 (t3,~b,e);
and AND4 (t4,c,e);
and AND5 (t5,a,~b,~c,d);

or OR1 (s,t1,t2,t3,t4,t5); 


endmodule //fim Karnaugh 
module testeKarnaugh ;

wire s;
reg a,b,c,d,e;

Karnaugh Teste (s,a,b,c,d,e);

 initial begin
      $display("\na  b   c   d  e  s\n");
      $monitor("%b  %b   %b   %b  %b  %b", a, b, c, d, e, s);
  
	     a=0; b=0; c=0; d=0; e=0; 
    #1  a=0; b=0; c=0; d=0; e=1; 
    #1  a=0; b=0; c=0; d=1; e=0;
    #1  a=0; b=0; c=0; d=1; e=1;
    #1  a=0; b=0; c=1; d=0; e=0;
 	 #1  a=0; b=0; c=1; d=0; e=1;
    #1  a=0; b=0; c=1; d=1; e=0;
    #1  a=0; b=0; c=1; d=1; e=1;
    #1  a=0; b=1; c=0; d=0; e=0;
    #1  a=0; b=1; c=0; d=0; e=1;
    #1  a=0; b=1; c=0; d=1; e=0;
    #1  a=0; b=1; c=0; d=1; e=1;
    #1  a=0; b=1; c=1; d=0; e=0;
    #1  a=0; b=1; c=1; d=0; e=1;
    #1  a=0; b=1; c=1; d=1; e=0;
    #1  a=0; b=1; c=1; d=1; e=1;
    #1  a=1; b=0; c=0; d=0; e=0;
    #1  a=1; b=0; c=0; d=0; e=1;
    #1  a=1; b=0; c=0; d=1; e=0;
    #1  a=1; b=0; c=0; d=1; e=1;
    #1  a=1; b=0; c=1; d=0; e=0;
    #1  a=1; b=0; c=1; d=0; e=1;
    #1  a=1; b=0; c=1; d=1; e=0;
    #1  a=1; b=0; c=1; d=1; e=1;
    #1  a=1; b=1; c=0; d=0; e=0;
    #1  a=1; b=1; c=0; d=0; e=1;
    #1  a=1; b=1; c=0; d=1; e=0;
    #1  a=1; b=1; c=0; d=1; e=1;
    #1  a=1; b=1; c=1; d=0; e=0;
    #1  a=1; b=1; c=1; d=0; e=1;
    #1  a=1; b=1; c=1; d=1; e=0;
    #1  a=1; b=1; c=1; d=1; e=1;
   
        
    end
    endmodule





