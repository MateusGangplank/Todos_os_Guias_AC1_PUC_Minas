// ---------------------
// Guia 03 - Exercicio 02 - Half Adder
// Nome: Paulo Ricardo Bastos de Souza
// Matricula: 405828
// ---------------------

// ---------------------
// -- half adder
// ---------------------

module halfAdder (s1, s0, a, b);
 output s1, s0;
 input  a, b;
 wire x, y, k, z, w, q;
 
 nand NAND1 (y, a, a);
 nand NAND2 (z, b, b);
 nand NAND3 (k, y, z); // porta or
 
 nand NAND4 (x, a, b);
 nand NAND5 (s1,x, x); // porta and
 
 nand NAND6 (w, s1, s1); // porta not
 
 nand NAND7 (q, k, w);
 nand NAND8 (s0, q, q); // porta and
 
endmodule // halfAdder

// ---------------------
// -- test halfAdder
// ---------------------

module testhalfAdder;
 reg   a, b;
 wire  s1, s0;
          // instancia
 halfAdder HA1 (s1, s0, a, b);

 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 03 - Exercicio 02 - Paulo Ricardo Bastos de Souza - 405828");
      $display("Test Half Adder");
      $display("\na + b = s0 , s1\n");
      $monitor("%b + %b = %b , %b", a, b, s0, s1);
  #1 a=0; b=1;
  #1 a=1; b=0;
  #1 a=1; b=1;
 end

endmodule // halfAdder