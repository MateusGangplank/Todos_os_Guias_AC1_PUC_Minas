// ---------------------
// Exemplo 01_03 - OR
// Nome: xxx yyy zzz
// Matricula: 999999
// ---------------------

// ---------------------
// -- or gate
// ---------------------

module orgate (s, p, q);
 output s;
 input  p, q;

 assign s = p | q;

endmodule // orgate

// ---------------------
// -- test or gate
// ---------------------

module testorgate;
 reg   a, b;             
 wire  s;
          // instancia
 orgate OR1 (s, a, b);

 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Exemplo 01_03 - xxx yyy zzz - 999999");
      $display("Test OR gate");
      $display("\na | b = s\n");
      $monitor("%b | %b = %b", a, b, s);
  #1  a=0; b=1;
  #1  a=1; b=0;
  #1  a=1; b=1;
 end

endmodule // testorgate
