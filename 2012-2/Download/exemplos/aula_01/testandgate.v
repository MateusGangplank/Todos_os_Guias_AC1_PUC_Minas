// ---------------------
// Exemplo 01_01 - AND
// Nome: xxx yyy zzz
// Matricula: 999999
// ---------------------

// ---------------------
// -- and gate
// ---------------------

module andgate (s, p, q);
 output s;
 input  p, q;

 assign s = p & q;

endmodule // andgate

// ---------------------
// -- test and gate
// ---------------------

module testandgate;
 reg   a, b;
 wire  s;
          // instancia
 andgate AND1 (s, a, b);
 
          // parte principal
 initial begin
      $display("Exemplo 01_01 - xxx yyy zzz - 999999");
      $display("Test AND gate");
      $display("\na & b = s\n");
      a=0; b=0;
  #1  $display("%b & %b = %b", a, b, s);
      a=0; b=1;
  #1  $display("%b & %b = %b", a, b, s);
      a=1; b=0;
  #1  $display("%b & %b = %b", a, b, s);
      a=1; b=1;
  #1  $display("%b & %b = %b", a, b, s);
 end

endmodule // testandgate
