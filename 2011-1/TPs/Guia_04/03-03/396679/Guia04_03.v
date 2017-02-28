// ---------------------
// Guia 04_03 - FullSubtractor com Half-Subtractor
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ---------------------

// ---------------------
// -- Half-Subtractor
// ---------------------

module halfsubtractor (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 wire q0;
 
xor XOR1 (s0, a, b);
not NOT1 (q0, a);
and AND1 (s1, q0, b);
 
 endmodule //halfsubtractor
 
// ---------------------
// -- fullsubtractor
// ---------------------

module fullsubtractor(s0, s1, a, b, c);
wire q0,q1,q2;
output s0, s1;
input a, b, c;

halfsubtractor MD1 (q0, q1, a, b);
halfsubtractor MD2 (s0, q2, c, q0);
or OR1 (s1, q1, q2);

endmodule // fullsubtractor

// --------------------------
// -- test fullsubtractor
// --------------------------

module testfullsubtractor;
 reg   a, b, c;             
 wire  s0, s1;
          // instancia
 fullsubtractor fullsubtractor1 (s0, s1, a, b, c);

 initial begin:start
      a=0; b=0; c=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 04_02 - Bruno Cezar Andrade Viallet - 396679");
      $display("Fulladder usando Half-Adders.");
      $display("\nc a b = s0 s1\n");
      $monitor(" %b %b %b = %b %b", c, a, b, s0, s1);
#1 a=0;b=1;c=0;
#1 a=1;b=0;c=0;
#1 a=1;b=1;c=0;
#1 a=0;b=0;c=1;
#1 a=0;b=1;c=1;
#1 a=1;b=0;c=1;
#1 a=1;b=1;c=1;
  
 end

endmodule // testfullsubtractor