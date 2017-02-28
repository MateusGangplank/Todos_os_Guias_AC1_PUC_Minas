// -----------------------------------------
// - Guia 07 - Luis Vasconcelos Dias - 412753
// - Exemplo0053test.v
// - Ci�ncia da Computa��o - 2�Pe�odo
// ----------------------------------------- 

// --------------------
// --- Mealy-Moore FSM
// --------------------
//

    `include "Exemplo0053.v"

   module Exemplo0053test;
	reg clk, reset, x;
	wire m1;

   exemplo0053 moore1010 ( m1, x, clk, reset );

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
#10 x = 0;
#10 x = 1;
#10 x = 1;
#10 x = 1;
#10 x = 0;
#10 x = 1;
#10 x = 0;
#10 x = 1;  // ACRESCENTADO
#30 $finish;

   end // initial

   always
#5 clk = ~clk;

   always @( posedge clk )
     begin
    $display ( "%4d %4b %5b", $time, x, m1 );

    end // always at positive edge clocking changing

endmodule // Exemplo0053test