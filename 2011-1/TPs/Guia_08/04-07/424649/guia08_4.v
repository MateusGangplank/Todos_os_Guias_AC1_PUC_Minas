// Giselle Caroline Vieira
// Matricula: 424649
// Guia 08
module SOP (s,a,b,c,d);
output s;
input a,b,c,d;
wire t1,t2,t3,t4,t5,t6,t7,t8,t9,t10;


nand NAND1(t1,~a,c);
nand NAND2(t2,t1);
nand NAND3(t3,b,c);
nand NAND4(t4,t3);
nand NAND5 (t5,b,d);
nand NAND6 (t6,t5);
nand NAND7 (t7,a,~c,d);
nand NAND8 (t8,t7);


nand NAND9 (t10,t2,t4); 
nand NAND10 (t9,t6,t8); 

nand NAND11 (s,t10,t9);

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

