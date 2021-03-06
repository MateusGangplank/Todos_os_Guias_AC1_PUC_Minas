// --------------------
// --- Mealy-Moore FSM
// --------------------
//
// Jenifer Henrique - 427420
`include "mealyx000.v"

module Exemplo0055;
reg clk, reset, x;
wire m1, m2;
mealyx000 mealy2 ( m1, x, clk, reset );
initial
begin
$display ( "Time  X    Mealy" );
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
#10 x = 0;
#10 x = 0;
#10 x = 0;
#10 x = 1;
#10 x = 0;
#30 $finish;
end // initial
always
#5 clk = ~clk;
always @( posedge clk )
begin
$display ( "%4d %4b %4b ", $time, x, m1 );
end // always at positive edge clocking changing
endmodule // Exemplo0052