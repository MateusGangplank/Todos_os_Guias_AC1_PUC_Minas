
// Guia 01_03 - XNOR
// Nome: Henrique Carvalho Parreira
// Matricula: 347133

// ---------------------
// -- xnor gate
// ---------------------

module xnorgate (s, a, b, c, d);
 output s;
 input  a, b, c, d;

 assign s = ~(a ^ b ^ c ^ d);

endmodule // xnorgate


// --------------------------
// -- test xnorgate
// --------------------------

module testxnorgate;
 reg   a, b, c, d;             
 wire  s;
          // instancia
 xnorgate XNOR1 (s, a, b, c, d);

          // parte principal
 initial begin:main
      $display("Guia 01_03 - Henrique CArvalho Parreira - 347133");
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

endmodule // testxnorgate
