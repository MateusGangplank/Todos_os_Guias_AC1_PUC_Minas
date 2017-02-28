// ---------------------
// Guia08_01
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
 
 not NOT1 (w0, a);
 not NOT2 (w1, d);
 not NOT3 (w2, b);
 and AND1 (w3, w0, c, d);
 and AND2 (w4, a, b, w1);
 and AND3 (w5, w2, c);
 or  OR1 (s, w3, w4, w5);
   
 endmodule // circuito 

// ----------------------
// -- Exercicio0801
// ----------------------

 module Exercicio0801;
 reg   a, b, c, d;
 wire  s;
          // instancia
 circuito circuito01 (s, a, b, c,d);
 
          // parte principal
 initial begin
      $display("Exercicio0801");
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

endmodule // Exercicio0801
