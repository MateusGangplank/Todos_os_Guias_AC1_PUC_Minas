// ---------------------
// Guia01_01 - NAND
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ---------------------

// ---------------------
// -- nand gate
// ---------------------

module nandgate (s, p, q);
 output s;
 input  p, q;

 assign s = ~(p & q);

endmodule // nandgate

// ---------------------
// -- test nand gate
// ---------------------

module testnandgate;
 reg   a, b, c;
 wire  s;
          // instancia
 nandgate NAND1 (s, a, b);
          // parte principal
 initial begin
      $display("Guia01_01 - Bruno Cezar Andrade Viallet - 396679");
      $display("Test NAND gate");
      $display("\n~(a & b) = s\n");
      a=0; b=0;
  #1  $display("~(%b & %b )= %b", a, b, s);
      a=0; b=1;
  #1  $display("~(%b & %b )= %b", a, b, s);
      a=1; b=0;
  #1  $display("~(%b & %b )= %b", a, b, s);
      a=1; b=1;
  #1  $display("~(%b & %b )= %b", a, b, s);
 end

endmodule // testnandgate
