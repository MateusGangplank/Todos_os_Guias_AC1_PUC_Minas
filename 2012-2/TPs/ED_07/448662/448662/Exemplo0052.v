// ---------------
// Exemplo0052 - Máquinas de estado finito - Mealy FSM
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 20/09/2012
// ----------------

// --------------------
// --- Mealy FSM
// --------------------
`include "Mealy1010.v"

module Exemplo0052;
reg clk, reset, x;
wire m1;
mealy1010 mealy1 ( m1, x, clk, reset );
initial
begin
$display ( "Time    X    Mealy " );
// Valores iniciais
clk = 1;
reset = 0;
x = 1;

// Entrada da mudança de sinal
#5 reset = 1;
#10 x = 0;
#10 x = 1;
#10 x = 0;
#10 x = 0;
#10 x = 1;
#30 $finish;
end // initial
always
#5 clk = ~clk;
always @( posedge clk )
begin
$display ( "%4d %4b %4b", $time, x, m1);
end // Sempre em borda positiva ou mudança de clock

endmodule // Exemplo0052