// -------------------- 
// --- Mealy-Moore FSM 
// -------------------- 
// 
 
`include "mealy0111.v"
 
module Exemplo0054; 
 reg   clk, reset, x; 
 wire  m1, m2; 
 
 mealy0111 mealy1  ( m1, x, clk, reset ); 
 
 initial 
  begin 
   $display ( "Time     X   Mealy 0111" ); 
 
// initial values 
       clk   = 1; 
       reset = 0; 
       x     = 0; 
 
// input signal changing 
  #3    reset = 1; 
  #6   x = 1; 
  #9   x = 0; 
  #12  x = 1; 
  #15  x = 1; 
  #18  x = 1; 
 
  #30 $finish; 
 end // initial 
 
 always 
  #5 clk = ~clk; 
 
 always @( posedge clk ) 
  begin 
   $display ( "%4d  %4b  %4b", $time, x, m1 ); 
  end // always at positive edge clocking changing 
 
endmodule // Exemplo0054