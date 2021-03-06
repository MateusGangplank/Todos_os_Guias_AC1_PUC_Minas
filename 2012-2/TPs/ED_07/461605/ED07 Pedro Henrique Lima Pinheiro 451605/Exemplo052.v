// -------------------------------------
// --- Pedro Henrique Lima Pinheiro ----
// --- 451605 --------------------------
// -------------------------------------
// --- Mealy-Moore FSM -----------------
// -------------------------------------

`include "Mealy1010.v"
module Exemplo0051;
reg clk, reset, x;
wire m1, m2;
Mealy1010 mealy1 ( m1, x, clk, reset );
initial
begin
$display ( "Time X Mealy Moore" );
// initial values
clk = 1;
reset = 0;
x = 0;
// input signal changing
#5 reset = 1;
#10 x = 1;
#10 x = 0;
#10 x = 1;
#20 x = 0;
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
$display ( "%4d %4b %4b %5b", $time, x, m1, m2 );
end // always at positive edge clocking changing
endmodule // Exemplo0051