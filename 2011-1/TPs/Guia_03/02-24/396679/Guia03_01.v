// ---------------------
// Guia03_01 - Meia Soma Tradicional
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ---------------------

// ---------------------
// -- module half-adder
// ---------------------

module halfadder (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 wire s2,s3;
 
 or orgate1(s2, a, b);
 and andgate1( s1, a, b);
 not notgate1 (s3, s1)
 and andgate2 (s0, s2, s3);


endmodule // halfadder

// ---------------------
// -- test halfadder
// ---------------------

module testhalfadder;
 reg   a, b;             
 wire  s0, s1;
          // instancia
 halfadder ha1 (s0, s1, a, b);

 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Guia03_01 - Bruno Cezar Andrade Viallet - 396679");
      $display("Test Half-Adder)");
      $display("\n a & b = s0 s1\n");
      $monitor(" %b & %b = %b %b", a, b, s0, s1);
  #1  a=0; b=1; 
  #1  a=1; b=0; 
  #1  a=1; b=1; 
  
 end

endmodule // testhalfadder
