// -------------------------
// Nome: Marcio Enio Gon�alves Dutra Junior
// Matricula: 441698
// -------------------------

// -------------------- 
// --- Mealy-Moore FSM 
// -------------------- 
// 
 
`include "moore1010.v" 
 
module Exemplo0053; 
 reg   clk, reset, x; 
 wire  m1; 
 
 moore1010  moore1  ( m1, x, clk, reset ); 
 
 initial 
  begin 
   $display ( "Time     X   Moore" ); 
 
// initial values 
       clk    = 1; 
       reset = 0; 
       x       = 1; 
 
// input signal changing 
  #5    reset = 1; 
  #10  x = 0; 
  #10  x = 1; 
  #10  x = 0; 
  #10  x = 1; 
  #10  x = 0; 
  #10  x = 1; 
  #10  x = 0; 
  #10  x = 1; 
 
  #30 $finish; 
 end // initial 
 
 always 
  #5 clk = ~clk; 
 
 always @( posedge clk ) 
  begin 
   $display ( "%4d  %4b  %4b", $time, x, m1 ); 
  end // always at positive edge clocking changing 
 
endmodule // Exemplo0053 