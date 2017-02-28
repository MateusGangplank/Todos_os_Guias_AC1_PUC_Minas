// ---------------------
// Guia 02 - Exercicio 03 - AND
// Nome: Paulo Ricardo Bastos de Souza
// Matricula: 405828
// ---------------------

// ---------------------
// -- and gate
// ---------------------

module andgate (s, p);
 output s;
 input  p;
 
 assign s = ~(p & p);

endmodule // andgate

// ---------------------
// -- test andgate
// ---------------------

module testandgate;
 reg   a;
 wire  s;
          // instancia
 andgate AND1 (s, a);

 initial begin:start
      a=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 02 - Exercicio 03 - Paulo Ricardo Bastos de Souza - 405828");
      $display("Test and gate");
      $display("\n~a = s\n");
      $monitor("%b = %b", a, s); 
  #1 a=1;
 end

endmodule // andgate