// -------------------- 
// --- Mealy-Moore FSM 
// -------------------- 
// 
 
`include "Moore1010.v"  
 
module Exemplo0053; 
 reg   clk, reset, x; 
 wire  m1; 
 
 moore1010  moore1  ( m1, x, clk, reset );
 
 initial 
  begin 
   $display ( "Time     X   Moore" ); 
 
// initial values 
       clk    = 1; 
       reset  = 0; 
       x      = 0; 
 
// input signal changing 
  #3    reset = 1; 
  #6  x = 1; 
  #9  x = 0; 
  #12  x = 1; 
  #15  x = 0; 
  #18  x = 0; 
 
  #25 $finish; 
 end // initial 
 
 always 
  #6 clk = ~clk; 
 
 always @( posedge clk ) 
  begin 
   $display ( "%4d  %4b  %4b", $time, x, m1 ); 
  end // always at positive edge clocking changing 
 
endmodule // Exemplo0053