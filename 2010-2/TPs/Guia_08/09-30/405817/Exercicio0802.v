// ---------------------
// Guia08_02
// Nome: Luiz Felipe Fonseca
// Matricula: 405817
// ---------------------

// ---------------------
// -- module
// ---------------------

 module circuito (s, a, b, c, d);
 output s;
 input  a, b, c, d;
 wire w0, w1, w2, w3, w4, w7, w8;
 
 not NOT1 (w0, a);
 not NOT2 (w1, b);
 not NOT3 (w2, c);
 not NOT4 (w3, d);
 and  AND1 (w4, a, w1, w2);
 and  AND2 (w5, w0, w1, w3);
 and  AND3 (w6, w0, w2, w3);
 and  AND4 (w7, a, w1, d);
and  AND5 (w8, a, w2, d); 
or  OR1(s, w4, w5, w6, w7, w8);
    
 endmodule // circuito 

// ----------------------
// -- Exercicio0802
// ----------------------

 module Exercicio0802;
 reg   a, b, c, d;
 wire  s;
          // instancia
 circuito circuito02 (s, a, b, c,d);
 
          // parte principal
 initial begin
      $display("Exercicio0802");
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

endmodule // Exercicio0802
