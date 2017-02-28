// ---------------------
// Guia 01 - Exercicio 01 - NOR
// Nome: Paulo Ricardo Bastos de Souza
// Matricula: 405828
// ---------------------

// ---------------------
// -- nor gate
// ---------------------

module norgate (s, p, q, r);
 output s;
 input  p, q, r;
 wire temp1, temp2;
 
 or OR1 (temp1, p, q);
 or OR2 (temp2, temp1, r);

 assign s = ~(temp2);

endmodule // norgate

// ---------------------
// -- test norgate
// ---------------------

module testnorgate;
 reg   a, b, c;
 wire  s;
          // instancia
 norgate NOR1 (s, a, b, c);

 initial begin:start
      a=0; b=0; c=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 01 - Exercicio 01 - Paulo Ricardo Bastos de Souza - 405828");
      $display("Test nor gate");
      $display("\n~(a & b & c) = s\n");
      $monitor("~(%b & %b & %b) = %b", a, b, c, s);
  #1 a=0; b=1; c=0;
  #1 a=1; b=0; c=1;
  #1 a=1; b=1; c=1;
 end

endmodule // norgate