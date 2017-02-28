// ---------------------
// Guia 01_04- XOR
// Nome:Henrique Carvalho Parreira
// Matricula: 347133
// ---------------------

// ---------------------
// -- xor gate
// ---------------------

module xorgate (s, a, b);
 output s;
 input  a, b;

 assign s = a ^ b;

endmodule // xorgate


// --------------------------
// -- test xorgate
// --------------------------

module testxorgate;
 reg   a, b;             
 wire  s;
          // instancia
 xorgate XOR1 (s, a, b);

          // parte principal
 initial begin:main
      $display("Guia 01_04(Extra) - Henrique Carvalho Parreira - 347133");
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
