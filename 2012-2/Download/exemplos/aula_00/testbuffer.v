// ---------------------
// Exemplo 00 - buffer
// Nome: xxx yyy zzz
// Matricula: 999999
// ---------------------

// ---------------------
// -- buffer
// ---------------------

module buffer (s, p);
 output s;
 input  p;

 assign s = p;

endmodule // buffer

// ---------------------
// -- test buffer
// ---------------------

module testbuffer;
 reg   a;
 wire  s;
          // instancia
 buffer BF1 (s, a);

 initial begin:start
      a=0;
 end

          // parte principal
 initial begin:main
      $display("Exemplo 00 - xxx yyy zzz - 999999");
      $display("Test buffer");
      $display("\na = s\n");
      $monitor("%b = %b", a, s);
  #1  a=0;
  #1  a=1;
 end

endmodule // buffer