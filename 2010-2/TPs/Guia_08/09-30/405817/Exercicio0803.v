// ---------------------
// Guia08_03
// Nome: Luiz Felipe Fonseca
// Matricula: 405817
// ---------------------

// ---------------------
// -- module
// ---------------------

 module circuito (f, a, b, c, d, e);
 output f;
 input  a, b, c, d,e;
 wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12;
 
 not NOT1 (s8, a);
 not NOT2 (s9, b);
 not NOT3 (s10, c);
 not NOT4 (s11, d);
 not NOT5 (s12,e);
 
 and AND1 (s0, c, d, e);
 and AND2 (s1, a, s9, s10, d, s12);
 and AND3 (s2, a, b, d, e);
 and AND4 (s3, s8, s10, s11);
 and AND5 (s4, b, s11, e);
 and AND6 (s5, s9, c, s11);
 and AND7 (s6, a, c, e);
 and AND8 (s7, b, c,d);
 or  OR1  (f, s0, s1, s2, s3, s4, s5, s6, s7);

    
 endmodule // circuito 

// ----------------------
// -- Exercicio0803
// ----------------------

 module Exercicio0803;
 reg   a, b, c, d,e;
 wire  s0;

 circuito circuito03 (s0, a, b, c,d, e);
 
          // parte principal
 initial begin
      $display("Exercicio0803");
      $display("Luiz Felipe Fonseca");
      $display("\na  b  c  d  e =  s0  \n");
      $monitor("%b  %b  %b  %b %b  =  %b", a, b, c, d, e, s0);   
	   a=0;b=0;c=0;d=0;e=0;
   #1 a=0;b=0;c=0;d=1;e=0;
   #1 a=0;b=0;c=1;d=0;e=0;
   #1 a=0;b=0;c=1;d=1;e=1;
   #1 a=0;b=1;c=0;d=0;e=1;
   #1 a=0;b=1;c=0;d=1;e=1;
   #1 a=0;b=1;c=1;d=0;e=1;
   #1 a=0;b=1;c=1;d=1;e=1;
   #1 a=1;b=0;c=0;d=0;e=1;
   #1 a=1;b=0;c=0;d=1;e=0;
   #1 a=1;b=0;c=1;d=0;e=0;
   #1 a=1;b=0;c=1;d=1;e=1;
   #1 a=1;b=1;c=0;d=0;e=1;
   #1 a=1;b=1;c=0;d=1;e=1;
   #1 a=1;b=1;c=1;d=0;e=1;
   #1 a=1;b=1;c=1;d=1;e=1;
	#1 a=0;b=0;c=0;d=0;e=1;
   #1 a=0;b=1;c=0;d=0;e=0;
   #1 a=0;b=0;c=1;d=0;e=1;   
   #1 a=0;b=0;c=1;d=1;e=1;  
 
 
 end  

endmodule // Exercicio0803