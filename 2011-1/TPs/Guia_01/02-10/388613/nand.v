// ---------------------
// Guia 01 - NAND
// Nome: Marden Santos Batista
// Matricula: 388613
// ---------------------

// ---------------------
// -- NAND gate
// ---------------------

module nandgate (s, p, q, t);
 output s;
 input  p, q, t;

 assign s = ~(p & (q & t));

endmodule // nandgate

// ---------------------
// -- test nand gate
// ---------------------

module testnandgate;
 reg   a, b,c;
 wire  s;
          // instancia
 nandgate NAND1 (s, a, b,c);
 
          // parte principal
 initial begin
      $display("Guia 01 - Marden Santos Batista - 388613");
      $display("Test NAND gate");
      $display("\n ~((a & b) & c) = s\n");
      a=0; b=0;c=0;
  #1  $display("%b & %b & %b = %b", a, b,c, s);
      a=0; b=0;c=1;
  #1  $display("%b & %b & %b = %b", a, b,c, s);
      a=0; b=1;c=1;
  #1  $display("%b & %b & %b = %b", a, b,c, s);
      a=1; b=1;c=1;
  #1  $display("%b & %b & %b = %b", a, b,c, s);
      a=1; b=1;c=0;
  #1  $display("%b & %b & %b = %b", a, b,c, s);
      a=1; b=0;c=0;
  #1  $display("%b & %b & %b = %b", a, b,c, s);
      a=1; b=0;c=1;
  #1  $display("%b & %b & %b = %b", a, b,c, s);

 end

endmodule // testnandgate

