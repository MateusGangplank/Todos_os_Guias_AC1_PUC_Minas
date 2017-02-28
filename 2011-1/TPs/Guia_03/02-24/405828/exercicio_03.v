// ---------------------
// Guia 03 - Exercicio 03 - Meia diferenca
// Nome: Paulo Ricardo Bastos de Souza
// Matricula: 405828
// ---------------------

// ---------------------
// -- meia diferenca
// ---------------------

module meiaDiferenca (s1, s0, a, b);
 output s1, s0;
 input  a, b;
 wire x;
 
 not NOT1 (x, a);
 and AND1 (s1, b, x);
 xor XOR1 (s0, a, b);
 
endmodule // meiaDiferenca

// ---------------------
// -- test meiaDiferenca
// ---------------------

module testmeiaDiferenca;
 reg   a, b;
 wire  s1, s0;
          // instancia
 meiaDiferenca MD1 (s1, s0, a, b);

 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 03 - Exercicio 03 - Paulo Ricardo Bastos de Souza - 405828");
      $display("Test Meia Diferenca");
      $display("\na - b = s0 , s1\n");
      $monitor("%b - %b = %b , %b", a, b, s0, s1);
  #1 a=0; b=1;
  #1 a=1; b=0;
  #1 a=1; b=1;
 end

endmodule // meiaDiferenca