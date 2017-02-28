// ---------------------
// Guia 01_01 - NAND
// Nome: Alyson Deives
// Matricula: 416589
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
      $display("Guia 01_01 - Alyson Deives - 416589");
      $display("Test NAND gate");
      $display("\na & b & c = s\n");
      a=0; b=0;c=0;
  #1  $display("%b & %b & %b = %b", a, b, c, s);
      a=0; b=0;c=1;
  #1  $display("%b & %b & %b = %b", a, b, c, s);
		a=0; b=1;c=0;
  #1  $display("%b & %b & %b = %b", a, b, c, s);
		a=0; b=1;c=1;
  #1  $display("%b & %b & %b = %b", a, b, c, s);
		a=1; b=0;c=0;
  #1  $display("%b & %b & %b = %b", a, b, c, s);
		a=1; b=0;c=1;
  #1  $display("%b & %b & %b = %b", a, b, c, s);
		a=1; b=1;c=0;
  #1  $display("%b & %b & %b = %b", a, b, c, s);
		a=1; b=1;c=1;
  #1  $display("%b & %b & %b = %b", a, b, c, s);
end

endmodule // testnandgate
