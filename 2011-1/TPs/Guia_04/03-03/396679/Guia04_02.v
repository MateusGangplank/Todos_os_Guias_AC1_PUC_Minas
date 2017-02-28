// ---------------------
// Guia 04_02 - FullAdder com halfadders
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ---------------------

// ---------------------
// -- Half-Adder
// ---------------------

module halfadder (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 
xor XOR1 (s0, a, b);
and AND1 (s1, a, b);
 
endmodule //halfadder

// ---------------------
// -- fulladder
// ---------------------

module fulladder(s0, s1, a, b, c);
 wire q0,q1,q2;
 output s0, s1;
 input a, b, c;

halfadder HA1 (q0, q1, a, b);
halfadder HA2 (s0, q2, q0, c);
or OR1 (s1, q1, q2);

endmodule // fulladder

// --------------------------
// -- test fulladder
// --------------------------

module testfulladder;
 reg   a, b, c;             
 wire  s0, s1;
          // instancia
 fulladder fulladder1 (s0, s1, a, b, c);

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

endmodule // testfulladder