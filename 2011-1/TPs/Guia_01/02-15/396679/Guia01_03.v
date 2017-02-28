// ---------------------
// Guia01_03 - XNOR
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ---------------------

// ---------------------
// -- xnor gate
// ---------------------

module xnorgate (s, p, q, r, t);
 output s;
 input  p, q, r, t;

 assign s = ~(p ^ q ^ r ^ t);

endmodule // xnorgate

// ---------------------
// -- test xnor gate
// ---------------------

module testxnorgate;
 reg   a, b, c, d;
 wire  s;
          // instancia
 xnorgate XNOR1 (s, a, b, c, d);
 
          // parte principal
 initial begin
      $display("Guia01_03 - Bruno Cezar Andrade Viallet - 396679");
      $display("Test XNOR gate");
      $display("\n~(a ^ b ^ c ^ d) = s\n");
      a=0; b=0;c=0;d=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=0; b=0;c=0;d=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=0; b=0;c=1;d=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=0; b=0;c=1;d=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=0; b=1;c=0;d=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=0; b=1;c=0;d=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=0; b=1;c=1;d=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=0; b=1;c=1;d=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=1; b=0;c=0;d=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=1; b=0;c=0;d=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=1; b=0;c=1;d=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=1; b=0;c=1;d=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=1; b=1;c=0;d=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=1; b=1;c=0;d=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=1; b=1;c=1;d=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=1; b=1;c=1;d=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);				
 end

endmodule // testxnorgate
