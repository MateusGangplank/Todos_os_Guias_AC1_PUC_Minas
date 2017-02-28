// ---------------------
// Guia 01_04 - XOR
// Nome: Alyson Deives
// Matricula: 416589
// ---------------------

// ---------------------
// -- xor gate
// ---------------------

module xorgate (s, p, q);
 output s;
 input  o, p, q, r;

 assign s = (p ^ q);

endmodule // xorgate

// ---------------------
// -- test xor gate
// ---------------------

module testxorgate;
 reg   a, b;
 wire  s;
          // instancia
 xorgate XOR1 (s, a, b);
 
          // parte principal
 initial begin
      $display("Guia 01_04 - Alyson Deives - 416589");
      $display("Test XOR gate");
      $display("\na ^ b = s\n");
      a=0; b=0;
  #1  $display("%b ^ %b = %b", a, b, s);
      a=0; b=1;
  #1  $display("%b ^ %b = %b", a, b, s);
      a=1; b=0;
  #1  $display("%b ^ %b = %b", a, b, s);
      a=1; b=1;
  #1  $display("%b ^ %b = %b", a, b, s);

  end

endmodule // testxorgate
