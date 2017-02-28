 // -------------------------------
// Guia 01_01 - NAND
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// ----------------------------
// -- Nand gate Tres entradas
// ----------------------------

 module Nandgate (s, p, q, r);
 output s;
 input  p, q, r;

 assign s = ~(p & q & r);

endmodule // Nandgate

// ---------------------
// -- test Nand gate
// ---------------------

module testNandgate;
 reg   a, b, c;
 wire  s;
          // instancia
 Nandgate NAND1 (s, a, b, c);
 
          // parte principal
 initial begin
      $display("\nguia01_01 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test NAND gate");
      $display("\n~(a & b & c) = s\n");
      a=0; b=0; c=0;
  #1  $display("~(%b & %b & %b) = %b", a, b, c, s);
      a=0; b=0; c=1;
  #1  $display("~(%b & %b & %b) = %b", a, b, c, s);
      a=0; b=1; c=0;
  #1  $display("~(%b & %b & %b) = %b", a, b, c, s);
      a=0; b=1; c=1;
  #1  $display("~(%b & %b & %b) = %b", a, b, c, s);
  	   a=1; b=0; c=0;
  #1  $display("~(%b & %b & %b) = %b", a, b, c, s);
      a=1; b=0; c=1;
  #1  $display("~(%b & %b & %b) = %b", a, b, c, s);
      a=1; b=0;
  #1  $display("~(%b & %b & %b) = %b", a, b, c, s);
      a=1; b=1; c=1;
  #1  $display("~(%b & %b & %b) = %b", a, b, c, s);

 end
 
endmodule // testNandgate

/*
RESULTADOS OBTIDOS

    ----jGRASP exec: vvp Nand.vvp
    
    
    guia01_01 - Ludmily Caldeira da Silva - 417290
    
    Test NAND gate
    
    ~(a & b & c) = s
    
    ~(0 & 0 & 0) = 1
    ~(0 & 0 & 1) = 1
    ~(0 & 1 & 0) = 1
    ~(0 & 1 & 1) = 1
    ~(1 & 0 & 0) = 1
    ~(1 & 0 & 1) = 1
    ~(1 & 0 & 1) = 1
    ~(1 & 1 & 1) = 0
    
     ----jGRASP: operation complete.

*/


