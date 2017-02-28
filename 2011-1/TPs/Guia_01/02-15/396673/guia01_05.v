// ---------------------
// Guia 01_05(Extra) - XOR
// Nome: Anderson Belchior de Carvalho
// Matricula: 396673
// ---------------------

// ---------------------
// -- xor gate
// ---------------------

module xorgate (s, a, b);
 output s;
 input  a, b;

 assign s = (~a & b | a & ~b) ;

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
      $display("Guia 01_05(Extra) - Anderson Belchior de Carvalho - 396673");
      $display("Test XOR gate");
      $display("\n(~a & b | a & ~b) = s\n");
      a=0; b=0;
  #1  $display("(~%b & %b | %b & ~%b) = %b", a, b, a, b, s);
      a=0; b=1;
  #1  $display("(~%b & %b | %b & ~%b) = %b", a, b, a, b, s);
      a=1; b=0; 
  #1  $display("(~%b & %b | %b & ~%b) = %b", a, b, a, b, s);
      a=1; b=1; 
  #1  $display("(~%b & %b | %b & ~%b) = %b", a, b, a, b, s);
    
 end

endmodule // testxorgate
