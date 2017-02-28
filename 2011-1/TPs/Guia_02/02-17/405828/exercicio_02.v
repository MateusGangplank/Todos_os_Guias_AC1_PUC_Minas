// ---------------------
// Guia 02 - Exercicio 02 - AND
// Nome: Paulo Ricardo Bastos de Souza
// Matricula: 405828
// ---------------------

// ---------------------
// -- and gate
// ---------------------

module andgate (s, p, q);
 output s;
 input  p, q;
 wire temp1, temp2;
 
 nor NOR1 (temp1, p);
 nor NOR2 (temp2, q);
 
 assign s = ~(temp1 | temp2);

endmodule // andgate

// ---------------------
// -- test andgate
// ---------------------

module testandgate;
 reg   a, b;
 wire  s;
          // instancia
 andgate AND1 (s, a, b);

 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 02 - Exercicio 02 - Paulo Ricardo Bastos de Souza - 405828");
      $display("Test and gate");
      $display("\na & b = s\n");
      $monitor("%b & %b = %b", a, b, s);
  #1 a=0; b=1; 
  #1 a=1; b=0; 
  #1 a=1; b=1; 
 end

endmodule // andgate