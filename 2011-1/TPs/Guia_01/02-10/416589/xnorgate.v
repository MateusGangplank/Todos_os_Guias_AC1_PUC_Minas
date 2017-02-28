// ---------------------
// Guia 01_03 - XNOR
// Nome: Alyson Deives
// Matricula: 416589
// ---------------------

// ---------------------
// -- xnor gate
// ---------------------

module xnorgate (s, o, p, q, r);
 output s;
 input  o, p, q, r;

 assign s = ~(o ^ p ^ q ^ r);

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
      $display("Guia 01_03 - Alyson Deives - 416589");
      $display("Test XNOR gate");
      $display("\na ^ b ^ c ^ d = s\n");
      a=0; b=0;c=0;d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=0; b=0;c=0;d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=0; b=0;c=1;d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=0; b=0;c=1;d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=0; b=1;c=0;d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=0; b=1;c=0;d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=0; b=1;c=1;d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=0; b=1;c=1;d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=1; b=0;c=0;d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=1; b=0;c=0;d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=1; b=0;c=1;d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=1; b=0;c=1;d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=1; b=1;c=0;d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=1; b=1;c=0;d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=1; b=1;c=1;d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=1; b=1;c=1;d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
  end

endmodule // testxnorgate
