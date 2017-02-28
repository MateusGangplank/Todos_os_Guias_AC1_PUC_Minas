// -----------------------------------------
// - Guia 07 - Wender Zacarias Xavier - 427472
// - Exemplo0054test.v
// - Ciência da Computação - 2ºPeríodo
// ----------------------------------------- 

// --------------------
// --- Mealy FSM
// --------------------
//

    `include "exemplo0054.v"

   module exemplo0054test;
	reg clk, reset, x;
	wire m1;

   exemplo0054 Mealy0111 ( m1, x, clk, reset );

   initial
      begin
   $display ( "Time    X    Mealy " );

// initial values
	clk = 1;
	reset = 0;
	x = 0;

// input signal changing

#10 x = 1;
#10 x = 0;
#10 x = 1;
#10 x = 0;
#10 x = 1;
#10 x = 0;
#10 x = 0;
#10 x = 1;
#10 x = 1;
#10 x = 1;
#10 x = 1;
#10 x = 1;
#10 x = 0;
#10 x = 1;
#10 x = 0;
#10 x = 1; 
#30 $finish;

   end // initial

   always
#5 clk = ~clk;

   always @( posedge clk )
     begin
    $display ( "%4d %4b %4b", $time, x, m1 );

    end // always at positive edge clocking changing

endmodule // Exemplo0054test