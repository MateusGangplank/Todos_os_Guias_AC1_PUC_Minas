// Breno Macena Pereira de Souza
// 462017

// -------------
// --Mealy-Moore FMS
// -------------
`include "Exemplo0052.v"
`include "Exemplo0053.v"
module Exemplo0053_e_52_test;
   reg clk, reset, x;
   wire m1, m2;

   mealy1010 mealy1 (m1, x, clk, reset);
   moore1010 moore1 (m2, x, clk, reset);

   initial
    begin
     $display("Time   X Mealy Moore");

     // valores iniciais
     clk = 1;
     reset = 0;
     x = 0;

     // mudanca de sinal
     #5  reset = 1;
     #10 x = 1;
     #10 x = 0;
     #10 x = 1;
     #10 x = 0;
     #10 x = 0;
     #10 x = 1;
     #10 x = 0;
     #10 x = 0;
     #10 x = 0;
     #10 x = 1;
     #10 x = 0;
     #10 x = 0;
     #10 $finish;
    end // inicial

    always
     #5 clk = ~clk;

    always @ (posedge clk)
     begin
      $display ("%4d %4b %4b %4b", $time, x, m1, m2);
     end // sempre em borda positiva de mudanca de clock
endmodule // Exemplo0051
