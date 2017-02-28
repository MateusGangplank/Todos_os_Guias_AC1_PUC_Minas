//
// AC 1 - 2010
// TP 08_04
// Nome:Igor Rodrigues de Oliveira
// Matricula: 380771
//


 module Exer4 (s, a, b, c, d);
 output s;
 input  a, b, c, d;
 wire w0, w1, w2, w3, w4, w5;
 
 nand NAND1 (w0, b, b);
 nand NAND2 (w1, a, a);
 nand NAND3 (w2, d, d);
 nand NAND4 (w3, w0, c);
 nand NAND5 (w4, w1, c, d);
 nand NAND6 (w5, b, a, w2);
 nand NAND7 (s, w3, w4, w5);
   
 endmodule


 module teste;
 reg   a, b, c, d;
 wire  s;
         
 Exer4 circ (s, a, b, c,d);
 
         
 initial begin
     $display("Igor Rodrigues de Oliveira - 380771");
      $display("Guia 8");
		$display("AC - 2010");
      $display("\na  b  c  d  =  s\n");
      $monitor("%b  %b  %b  %b  =  %b", a, b, c, d, s );   
	   a=0;b=0;c=0;d=0;
   #1 a=0;b=0;c=0;d=1;
   #1 a=0;b=0;c=1;d=0;
   #1 a=0;b=0;c=1;d=1;
   #1 a=0;b=1;c=0;d=0;
   #1 a=0;b=1;c=0;d=1;
   #1 a=0;b=1;c=1;d=0;
   #1 a=0;b=1;c=1;d=1;
   #1 a=1;b=0;c=0;d=0;
   #1 a=1;b=0;c=0;d=1;
   #1 a=1;b=0;c=1;d=0;
   #1 a=1;b=0;c=1;d=1;
   #1 a=1;b=1;c=0;d=0;
   #1 a=1;b=1;c=0;d=1;
   #1 a=1;b=1;c=1;d=0;
   #1 a=1;b=1;c=1;d=1;
     

 end

endmodule 
