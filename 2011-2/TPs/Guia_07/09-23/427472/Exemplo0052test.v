// -----------------------------------------
// - Guia 07 - Wender Zacarias Xavier - 427472
// - Exemplo0052test.v
// - Ci�ncia da Computa��o - 2�Pe�odo
// ----------------------------------------- 

// --------------------
// --- Mealy-Moore FSM
// --------------------
//

    `include "Exemplo0052.v"

   module Exemplo0052test;
	reg clk, reset, x;
	wire m1;

   exemplo0052 mealy101 ( m1, x, clk, reset );

   initial
      begin
   $display ( "Time    X    Mealy " );

// initial values
	clk = 1;
	reset = 0;
	x = 0;

// input signal changing

#5 reset = 1;
#10 x = 1;
#10 x = 0;
#10 x = 1;
#10 x = 0;
#10 x = 1;
#10 x = 1;
#10 x = 1;
#10 x = 0;
#10 x = 1;
#30 $finish;

   end // initial

   always
#5 clk = ~clk;

   always @( posedge clk )
     begin
    $display ( "%4d %4b %5b", $time, x, m1 );

    end // always at positive edge clocking changing

endmodule // Exemplo0052test