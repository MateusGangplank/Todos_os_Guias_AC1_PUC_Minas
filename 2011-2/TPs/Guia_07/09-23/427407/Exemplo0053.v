// ------------------------- 
// Exemplo0053 - Moore
// Nome: Guilherme Andrade Salum Terra 
// Matricula: 427407
// ------------------------- 

// -------------------- 
// --- Mealy FSM 
// -------------------- 
// 

`include "moore1010.v" 

module Exemplo0053; 
reg clk, reset, x; 
wire m1; 

moore1010 moore1 ( m1, x, clk, reset ); 


initial 
begin 
$display ( "Time    X  Moore" ); 

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

/*
Testes

 Time   X  Moore
  10    0    0
  20    1    0
  30    0    0
  40    1    0
  50    1    0
  60    0    0
  70    1    0
  80    1    1
  90    0    0
 100    1    0
 110    1    1
 120    1    0
*/