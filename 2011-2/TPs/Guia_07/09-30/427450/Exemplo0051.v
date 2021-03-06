// ------------------------------------
// Nome: Patrick Fl�vio Teixeira Coura
// Matricula: 427450
// -------------------------------------

// -------------------- 
// --- Mealy-Moore FSM 
// -------------------- 
// 
`include "Mealy1101.v" 
`include "Moore1101.v" 

module Exemplo0051; 
reg clk, reset, x; 
wire m1, m2; 
mealy1101 mealy1 ( m1, x, clk, reset ); 
moore1101 moore1 ( m2, x, clk, reset ); 
initial 
begin 
$display("Exemplo0051 - Patrick Flavio Teixeira Coura - 427450");
$display ( "Time X Mealy Moore" ); 
// initial values 
clk = 1; 
reset = 0; 
x = 1; 
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