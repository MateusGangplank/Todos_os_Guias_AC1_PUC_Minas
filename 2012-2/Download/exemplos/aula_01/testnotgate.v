// ---------------------
// Exemplo 01_02 - NOT
// Nome: xxx yyy zzz
// Matricula: 999999
// ---------------------

// ---------------------
// -- not gate
// ---------------------

module notgate (s, p);
 output s;
 input  p;

 assign s = ~p;

endmodule // notgate

// ---------------------
// -- test not gate
// ---------------------

module testnotgate;
 reg   a;
 wire  s;
          // instancia
 notgate NOT1 (s, a);

          // parte principal
 initial begin
      $display("Exemplo 01_02 - xxx yyy zzz - 999999");
      $display("Test NOT gate");
      $display("\n~a = s\n");
      a=0;
  #1  $display("~%b = %b", a, s);
      a=1;
  #1  $display("~%b = %b", a, s);
 end

endmodule // testnotgate
