// ---------------------------
// Guia 04 - Exercicio 3
// Nome: Marco Antonio M. Belo
// Matricula: 410796
// ---------------------------

// ---------------------
// -- Meia Difenca
// ---------------------

module meia_diferenca(s0, s1, p, q);
 output s0, s1;
 input  p,q;
 wire temp1;
 
 xor XOR1(s0, p,q);
 not NOT1(temp1, p);
 and AND1(s1, q,temp1);
 
endmodule 

// ---------------------
// -- Difenca Completa
// ---------------------

module diferenca(s0, s1, p, q, s);
 output s0, s1;
 input  p, q, s;
 wire temp1, temp2, temp3;
 
 meia_diferenca D1(temp1, temp2, p, q);
 meia_diferenca D2(s0, temp3, temp1, s);
 xor XOR1(s1, temp3,temp2);
 
endmodule 

// ---------------------
// -- test 
// ---------------------

module test;
 reg   a, b, c;
 wire  s0, s1;
          // instancia
 diferenca D1(s1, s0, a, b,c);
 
 initial begin:start
      a=0; b=0; c=0;
 end

          // parte principal
 initial begin:main
      $display("Exercico 3 - GUIA 04\nMarco Antonio M. Belo - 410796\n");
      $display("Half Adder");
      $display("\na - b - c = s\n");
      $monitor("%b - %b - %b = %b%b", a, b, c, s0, s1);
  #1  a=0; b=0; c=1;
  #1  a=0; b=1; c=0;
  #1  a=0; b=1; c=1;
  #1  a=1; b=0; c=0;
  #1  a=1; b=0; c=1;
  #1  a=1; b=1; c=0;
  #1  a=1; b=1; c=1;
 end
endmodule // testxorgate