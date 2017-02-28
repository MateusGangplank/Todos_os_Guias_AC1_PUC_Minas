// ---------------------
// Guia 01 Ex1 - NAND
// Nome:Álvaro Henrique de Araújo Rungue
// Matricula: 395487
// ---------------------

// ---------------------
// -- and gate
// ---------------------

module nandgate (s, p, q );
 output s;
 input  p, q;

 assign s = ~(p & q );

endmodule // nandgate

// ---------------------
// -- test nand gate
// ---------------------

module testnandgate;
 reg   a, b;
 wire  s;
          // instancia
 nandgate NAND1 (s, a, b  );
 
          // parte principal
 initial begin
      $display("Guia 1 Exercicio 1 - Alvaro");
      $display("Test NAND gate");
      $display("\na & b  = s\n");
      a=0; b=0;
  #1  $display("%b & %b  = %b", a , b , s);
      a=0; b=1;
  #1  $display("%b & %b  = %b", a , b , s);
      a=1; b=0;
  #1  $display("%b & %b  = %b", a , b , s);
      a=1; b=1;
  #1  $display("%b & %b  = %b", a , b , s);

 end

endmodule // testnandgate
