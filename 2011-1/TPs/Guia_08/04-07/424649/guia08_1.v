// Giselle Caroline Vieira
// Matricula: 424649
// Guia 08
module SOP (s,a,b,c,d);
output s;
input a,b,c,d;
wire t1,t2,t3,t4;


and AND1(t1,~a,c);
and AND2(t2,b,c);
and AND3 (t3,b,d);
and AND4 (t4,a,~c,d);

or OR1 (s,t1,t2,t3,t4); 


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





