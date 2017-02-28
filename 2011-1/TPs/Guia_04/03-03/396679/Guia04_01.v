// ---------------------
// Guia 04_01 - Half-Adder NOR
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ---------------------

// ---------------------
// -- Half-Adder
// ---------------------

module halfadder (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 wire s2,s3,s4,s5,s6,s7;
 
 nor norgate1 (s2, a, a);
 nor norgate2 (s3, b, b);
 nor norgate3 (s4, s2, s3);
 nor norgate4 (s5, a, b);
 nor norgate5 (s0, s4, s5);
 nor norgate6 (s6, a, a);
 nor norgate7 (s7, b, b);
 nor norgate8 (s1, s6, s7);

endmodule // halfadder

// --------------------------
// -- test Half-Adder NOR
// --------------------------

module testehalfadder;
 reg   a, b;             
 wire  s0, s1;
          // instancia
 halfadder HALFADDER (s0, s1, a, b);

 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 04_01 - Bruno Cezar Andrade Viallet - 396679");
      $display("Teste Half-Adder NOR gate");
      $display("\n a & b = s0 s1\n");
      $monitor(" %b & %b = %b %b", a, b, s0, s1);
  #1  a=0; b=1; 
  #1  a=1; b=0; 
  #1  a=1; b=1; 
  
 end

endmodule // testhalfadder
