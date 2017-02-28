// Breno Macena Pereira de Souza
// 462017

// -------------
// --Mealy-Moore FMS
// -------------
`include "Exemplo0054.v"
module Exemplo0052_test;
   reg clk, reset, x;
   wire m1;

   mealy1100 mealy1 (m1, x, clk, reset);

   initial
    begin
     $display("Time   X Mealy");

     // valores iniciais
     clk = 1;
     reset = 0;
     x = 0;

     // mudanca de sinal
     #5  reset = 1;
     #10 x = 1;
     #10 x = 1;
     #10 x = 0;
     #10 x = 0;
     #10 x = 1;
     #10 x = 0;
     #10 x = 1;
     #10 x = 0;
     #10 x = 1;
     #10 x = 1;
     #10 x = 0;
     #10 x = 0;
     #10 x = 1;
     #10 $finish;
    end // inicial

    always
     #5 clk = ~clk;

    always @ (posedge clk)
     begin
      $display ("%4d %4b %4b", $time, x, m1);
     end // sempre em borda positiva de mudanca de clock
endmodule // Exemplo0051