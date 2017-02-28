// Giselle Caroline Vieira
// Matricula: 424649
// Guia 08
module SOP (s,a,b,c,d);
output s;
input a,b,c,d;
wire t1,t2,t3;


and AND1(t1,~a,~d);
and AND2(t2,a,d);
and AND3 (t3, a,~b,~c);

or OR1 (s,t1,t2,t3); 


endmodule //fim SOP

module testeSOP;

wire s;
reg a,b,c,d;

SOP Teste (s,a,b,c,d);

 initial begin
      $display("\na  b   c   d  s\n");
      $monitor("%b  %b   %b   %b  %b", a, b, c, d, s);
  
	     a=0; b=0; c=0; d=0;  
    #1  a=0; b=0; c=0; d=1;
    #1  a=0; b=0; c=1; d=0;
    #1  a=0; b=0; c=1; d=1;
    #1  a=0; b=1; c=0; d=0;
 	 #1  a=0; b=1; c=0; d=1;
    #1  a=0; b=1; c=1; d=0;
    #1  a=0; b=1; c=1; d=1;
    #1  a=1; b=0; c=0; d=0;
    #1  a=1; b=0; c=0; d=1;
    #1  a=1; b=0; c=1; d=0;
    #1  a=1; b=0; c=1; d=1;
    #1  a=1; b=1; c=0; d=0;
    #1  a=1; b=1; c=0; d=1;
    #1  a=1; b=1; c=1; d=0;
    #1  a=1; b=1; c=1; d=1;


        
    end
    endmodule





