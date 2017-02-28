// -------------------------
// Nome: Flavio Andrade Amaral Motta 
// Matricula: 392001
// --------------------------- 

// --------------------
// --- Moore FSM TEST SEM INTERSECAO
// --------------------
//
`include "Exemplo0053.v"
module Exemplo0053teste;
reg clk, reset, x;
wire m1;
moore1001 moore1 ( m1, x, clk, reset );
initial
begin
$display ( "Time X Moore" );
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
#20 x = 1;
#10 x = 0;
#20 x = 1;
#10 x = 0;
#10 x = 0;
#10 x = 1;
#10 $finish;
end // initial
always
#5 clk = ~clk;
always @( posedge clk )
begin
$display ( "%4d %4b %4b", $time, x, m1);
end // always at positive edge clocking changing
endmodule // Exemplo0053