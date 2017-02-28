// ---------------------
// Exemplo 04_02 - NOT
// Nome: xxx yyy zzz
// Matricula: 999999
// ---------------------

// ---------------------
// -- not gate
// ---------------------

module notgate (s, p);
 output [3:0] s;
 input  [3:0] p;

 assign s[0]   = ~p[0];
 assign s[1]   = ~p[1];
 assign s[3:2] = ~p[3:2];

endmodule // notgate

// ---------------------
// -- test not gate
// ---------------------

module testnotgate;
 reg   [3:0] a;
 wire  [3:0] s;
          // instancia
 notgate NOT1 (s, a);

          // parte principal
 initial begin
      $display("Exemplo 04_02 - xxx yyy zzz - 999999");
      $display("Test NOT gate");
      $display("\n~a = s\n");
      a=0000;
  #1  $display("~%4b = %4b", a, s);
      a=1001;
  #1  $display("~%4b = %4b", a, s);
 end

endmodule // testnotgate
