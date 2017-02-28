 // ------------------------- 
// Exemplo0053 - Mealy-Moore FSM 
// Nome: Lucas Cardoso 
// Matricula: 441694 
// ------------------------- 
// ------------------------- 
`include "Mealy1001.v" 

// ------------------------- definir dados 
module Exemplo0053; 

reg clk, reset, x; 
wire m1, m2; 
moore1001 moore1 ( m1, x, clk, reset ); 

// ------------------------- parte principal 
initial 
begin 
$display ( " Time   X  Moore" ); 

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
$display ( "%4d %4b %4b", $time, x, m1 ); 

end // always at positive edge clocking changing 

endmodule // Exemplo0053 