// ------------------------- 
// Exemplo0051
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 
// -------------------- 
// --- Mealy-Moore FSM 
// -------------------- 
// 
`include "mach.v" 
module Exemplo0051; 
reg clk, reset, x; 
wire m1, m2; 
mach1110 mach1 ( m1, x, clk, reset ); 
initial 
begin 
$display ( "Time X Mach" ); 
// initial values 
clk = 1; 
reset = 0; 
x = 0; 
// input signal changing 
#5 reset = 1; 
#10 x = 1; 
#10 x = 1; 
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
$display ( "%4d %4b %4b", $time, x, m1 ); 
end // always at positive edge clocking changing 
endmodule // Exemplo0051 