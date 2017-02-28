// --Nome: Guilherme Moreira Nunes
// --Matricula: 408947
// -------------------- 
// --- Mealy-Moore FSM 
// -------------------- 
// 
`include "Mealy1101.v" 
`include "moore1101.v" 
module Exemplo0051; 
reg clk, reset, x; 
wire m1, m2;
 
Mealy1101 mealy1 ( m1, x, clk, reset ); 
moore1101 moore1 ( m2, x, clk, reset ); 

initial 
begin 
$display ( "Guia 07 - Guilherme Moreira Nunes - 408947" );
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
/*
   Guia 07 - Guilherme Moreira Nunes - 408947
    Time X Mealy Moore
      10    0    0     0
      20    1    0     0
      30    0    0     0
      40    1    0     0
      50    1    0     0
      60    0    0     0
      70    1    1     0
      80    1    0     1
      90    0    0     0
     100    1    1     0
     110    1    0     1
     120    1    0     0
*/ 