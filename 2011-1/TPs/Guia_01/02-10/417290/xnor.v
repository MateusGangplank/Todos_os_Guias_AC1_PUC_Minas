 // -------------------------------
// Guia 01_03 - XNOR
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// ----------------------------
// -- XNOR gate Quatro entradas
// ----------------------------

 module xnorgate (s, p, q, r, t);
 output s;
 input  p, q, r, t;

 assign s = ~(p ^ q ^ r ^ t);

endmodule // xnorgate

// ---------------------
// -- test XNOR gate
// ---------------------

module testxnorgate;
 reg   a, b, c, d;
 wire  s;
          // instancia
 xnorgate XNOR1 (s, a, b, c, d);
 
          // parte principal
 initial begin
      $display("\nguia01_03 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test XNOR gate");
      $display("\n~(a ^ b ^ c ^ d) = s\n");
      a=0; b=0; c=0; d=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=0; b=0; c=0; d=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=0; b=0; c=1; d=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=0; b=0; c=1; d=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
  	   a=0; b=1; c=0; d=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=0; b=1; c=0; d=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=0; b=1; c=1; d=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=0; b=1; c=1; d=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=1; b=0; c=0; d=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=1; b=0; c=0; d=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=1; b=0; c=1; d=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=1; b=0; c=1; d=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
  	   a=1; b=1; c=0; d=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=1; b=1; c=0; d=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=1; b=1; c=1; d=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=1; b=1; c=1; d=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);

 end
 
endmodule // testxnordgate

/*
RESULTADOS OBTIDOS

     ----jGRASP exec: vvp xnor.vvp
    
    
    guia01_03 - Ludmily Caldeira da Silva - 417290
    
    Test XNOR gate
    
    ~(a ^ b ^ c ^ d) = s
    
    ~(0 ^ 0 ^ 0 ^ 0) = 1
    ~(0 ^ 0 ^ 0 ^ 1) = 0
    ~(0 ^ 0 ^ 1 ^ 0) = 0
    ~(0 ^ 0 ^ 1 ^ 1) = 1
    ~(0 ^ 1 ^ 0 ^ 0) = 0
    ~(0 ^ 1 ^ 0 ^ 1) = 1
    ~(0 ^ 1 ^ 1 ^ 0) = 1
    ~(0 ^ 1 ^ 1 ^ 1) = 0
    ~(1 ^ 0 ^ 0 ^ 0) = 0
    ~(1 ^ 0 ^ 0 ^ 1) = 1
    ~(1 ^ 0 ^ 1 ^ 0) = 1
    ~(1 ^ 0 ^ 1 ^ 1) = 0
    ~(1 ^ 1 ^ 0 ^ 0) = 1
    ~(1 ^ 1 ^ 0 ^ 1) = 0
    ~(1 ^ 1 ^ 1 ^ 0) = 0
    ~(1 ^ 1 ^ 1 ^ 1) = 1
    
     ----jGRASP: operation complete.

*/


