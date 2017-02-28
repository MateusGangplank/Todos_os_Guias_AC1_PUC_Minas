// ---------------------------
// Guia 04 - Exercicio 2
// Nome: Marco Antonio M. Belo
// Matricula: 410796
// ---------------------------

// ---------------------
// -- Meia Soma 
// ---------------------

module meia_soma(s0, s1, p, q);
 output s0, s1;
 input  p,q;
 
 xor XOR1(s0, p,q);
 and AND1(s1, p,q);
 
endmodule 

// ---------------------
// -- Soma Completa 
// ---------------------

module soma_completa(s0, s1, p, q, t);
 output s0, s1;
 input  p, q, t;
 wire temp1, temp2, temp3;
 
 meia_soma MS1(temp1, temp2, p, q);
 meia_soma MS2(s0, temp3, temp1, t);
 or OR1(s1, temp2, temp3);
 
 
endmodule 

// ---------------------
// -- test 
// ---------------------

module test;
 reg   a, b, c;
 wire  s0, s1;
          // instancia
 soma_completa SC1(s0, s1, a, b, c);
 
 initial begin:start
      a=0; b=0; c=0;
 end

          // parte principal
 initial begin:main
      $display("Exercico 1 - GUIA 04\nMarco Antonio M. Belo - 410796\n");
      $display("Half Adder");
      $display("\na + b = s\n");
      $monitor("%b + %b + %b = %b%b", a, b, c, s1, s0);
  #1  a=0; b=0; c=1;
  #1  a=0; b=1; c=0;
  #1  a=0; b=1; c=1;
  #1  a=1; b=0; c=0;
  #1  a=1; b=0; c=1;
  #1  a=1; b=1; c=0;
  #1  a=1; b=1; c=1;

 end
endmodule // testxorgate