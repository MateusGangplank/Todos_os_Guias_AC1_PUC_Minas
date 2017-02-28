// --------------------
// --- Mealy-Moore FSM
// --------------------
//
`include "Mealy1100.v"

module Exemplo0051;
reg clk, reset, x;
wire m1, m2;
mealy1100 mealy1 ( m1, x, clk, reset );

initial
begin
$display ( "Time X Moory" );
// initial values
clk = 1;
reset = 0;
x = 0;
// input signal changing

#5 reset = 1;
#10 x = 1;
#10 x = 1;
#10 x = 0;
#20 x = 0;
#10 x = 1;
#10 x = 1;
#10 x = 0;
#10 x = 0;
#30 $finish;
end // initial
always
#5 clk = ~clk;
always @( posedge clk )
begin
$display ( "%4d %4b %5b", $time, x, m1);
end // always at positive edge clocking changing
endmodule // Exemplo0051