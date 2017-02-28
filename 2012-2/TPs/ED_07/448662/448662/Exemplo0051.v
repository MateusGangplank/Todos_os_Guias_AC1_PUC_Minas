// ---------------
// Exemplo0051 - M�quinas de estado finito - Mealy e Moore FSM
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// Data: 20/09/2012
// ----------------

// --------------------
// --- Mealy-Moore FSM
// --------------------
`include "Mealy1101.v"
`include "Moore1101.v"

module Exemplo0051;
reg clk, reset, x;
wire m1, m2;
mealy1101 mealy1 ( m1, x, clk, reset );
moore1101 moore1 ( m2, x, clk, reset );
initial
begin
$display ( "Time X Mealy Moore" );
// Valores iniciais
clk = 1;
reset = 0;
x = 0;

// Entrada da mudan�a de sinal
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
end // Sempre em borda positiva ou mudan�a de clock

endmodule // Exemplo0051