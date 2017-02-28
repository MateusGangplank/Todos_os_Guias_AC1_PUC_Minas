// ---------------------
// Exemplo 04_01 - AND
// Nome: xxx yyy zzz
// Matricula: 999999
// ---------------------

// ---------------------
// -- and gate
// ---------------------

module andgate (s, p, q);
 output [2:0] s;
 input  [2:0] p, q;

 assign s = p & q;

endmodule // andgate

// ---------------------
// -- test and gate
// ---------------------

module testandgate;
 reg   [2:0] a, b;
 wire  [2:0] s;
          // instancia
 andgate AND1 (s, a, b);

          // parte principal
 initial begin
      $display("Exemplo 04_01 - xxx yyy zzz - 999999");
      $display("Test AND gate");
      $display("\na & b = s\n");
      a=3'b000; b=3'b000;
  #1  $display("%3b & %3b = %3b", a, b, s);
      a=3'b001; b=3'b111;
  #1  $display("%3b & %3b = %3b", a, b, s);
      a=3'b111; b=3'b101;
  #1  $display("%3b & %3b = %3b", a, b, s);
      a=3'b101; b=3'b010;
  #1  $display("%3b & %3b = %3b", a, b, s);
 end

endmodule // testandgate
