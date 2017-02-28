// ---------------------------
// Guia_03 - Exercicio 1
// Nome: Marco Antonio M. Belo
// Matricula: 0410796
// ---------------------------

// ---------------------
// -- half adder
// ---------------------

module half_adder (s0, s1, p, q);
 output s0, s1;
 input  p,q;
 wire temp1, temp2;
 
 or  OR1(temp1, p, q);
 and AND1(s1, p, q); 
 not NOT1(temp2, s1);
 and AND2(s0, temp2,temp1);
 
endmodule 

// ---------------------
// -- test half adder
// ---------------------

module test;
 reg   a, b;
 wire  s0, s1;
          // instancia
 half_adder MS1(s1, s0, a, b);
 
 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Exercico 1 - GUIA 03\nMarco Antonio M. Belo - 0410796\n");
      $display("Meia Soma");
      $display("\na + b = s\n");
      $monitor("%b + %b = %b%b", a, b, s0, s1);
  #1  a=0; b=1;
  #1  a=1; b=0;
  #1  a=1; b=1;

 end
endmodule // testxorgate