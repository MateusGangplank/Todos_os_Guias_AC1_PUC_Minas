// ---------------------
// Guia 03 - Exercicio 01 - Half Adder
// Nome: Paulo Ricardo Bastos de Souza
// Matricula: 405828
// ---------------------

// ---------------------
// -- half adder
// ---------------------

module halfAdder (s1, s0, a, b);
 output s1, s0;
 input  a, b;
 wire x, y;
 
 or OR1 (x, a, b);
 and AND1 (s1, a, b);
 not NOT1 (y, s1);
 and AND2 (s0, x, y);  

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
      $display("Guia 03 - Exercicio 01 - Paulo Ricardo Bastos de Souza - 405828");
      $display("Test Half Adder");
      $display("\na + b = s0 , s1\n");
      $monitor("%b + %b = %b , %b", a, b, s0, s1);
  #1 a=0; b=1;
  #1 a=1; b=0;
  #1 a=1; b=1;
 end

endmodule // halfAdder