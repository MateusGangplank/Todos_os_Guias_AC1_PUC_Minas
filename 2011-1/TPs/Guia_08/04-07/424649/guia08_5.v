// Giselle Caroline Vieira
// Matricula: 424649
// Guia 08
module SOP (s,a,b,c,d);
output s;
input a,b,c,d;
wire t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11;


nor NOR1(t1,~a);
nor NOR2(t2,~d);
nor NOR3(t3,t2); 
nor NOR4(t4,a);
nor NOR5(t5,d);
nor NOR6(t6,t5);
nor NOR7(t7,a);
nor NOR8(t8,~b);
nor NOR9(t9,~c);
nor NOR10(t10,t7,t8,t9);

nor NOR11 (t11,t3,t6,t10); 
nor NOR12 (s,t11); 


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





