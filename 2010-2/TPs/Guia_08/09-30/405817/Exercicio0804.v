// ---------------------
// Guia08_04
// Nome: Luiz Felipe Fonseca
// Matricula: 405817
// ---------------------

// ---------------------
// -- module
// ---------------------

 module circuito (s, a, b, c, d);
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
   
 endmodule // circuito 

// ----------------------
// -- Exercicio0804
// ----------------------

 module Exercicio0804;
 reg   a, b, c, d;
 wire  s;
          // instancia
 circuito circuito04 (s, a, b, c,d);
 
          // parte principal
 initial begin
      $display("Exercicio0804");
      $display("Luiz Felipe Fonseca - 405817");
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

endmodule // Exercicio0804
