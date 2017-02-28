// ---------------------
// Guia01_01 - NAND
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ---------------------

// ---------------------
// -- nand gate
// ---------------------

module nandgate (s, p, q, r);
 output s;
 input  p, q, r;

 assign s = ~(p & q & r);

endmodule // nandgate

// ---------------------
// -- test nand gate
// ---------------------

module testnandgate;
 reg   a, b, c;
 wire  s;
          // instancia
 nandgate NAND1 (s, a, b, c);
 
          // parte principal
 initial begin
      $display("Guia01_01 - Bruno Cezar Andrade Viallet - 396679");
      $display("Test NAND gate");
      $display("\n~(a & b & c) = s\n");
      a=0; b=0;c=0;
  #1  $display("~(%b & %b & %b )= %b", a, b, c, s);
      a=0; b=0;c=1;
  #1  $display("~(%b & %b & %b )= %b", a, b, c, s);
      a=0; b=1;c=0;
  #1  $display("~(%b & %b & %b )= %b", a, b, c, s);
      a=0; b=1;c=1;
  #1  $display("~(%b & %b & %b )= %b", a, b, c, s);
      a=1; b=0;c=0;
  #1  $display("~(%b & %b & %b )= %b", a, b, c, s);
      a=1; b=0;c=1;
  #1  $display("~(%b & %b & %b )= %b", a, b, c, s);
      a=1; b=1;c=0;
  #1  $display("~(%b & %b & %b )= %b", a, b, c, s);
      a=1; b=1;c=1;
  #1  $display("~(%b & %b & %b )= %b", a, b, c, s);		
 end

endmodule // testnandgate
