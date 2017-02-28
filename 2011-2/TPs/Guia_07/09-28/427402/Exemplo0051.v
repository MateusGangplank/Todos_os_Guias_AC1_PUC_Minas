// --------------------
// --- Mealy-Moore FSM 
// --- Felipe Ferreira Andrade do Carmo
// --- Exercicio 03
// -------------------- 
// 
 
`include "Mealy1101.v"
`include "Moore.v" 
`include "Exemplo0052.v"
`include "Exemplo0053.v"
`include "Exemplo0054.v"
 
module Exemplo0051; 
 reg   clk, reset, x; 
 wire  m1, m2, m3, m4, m5;
 
 mealy1101  mealy1  ( m1, x, clk, reset );
 mealy101   mealy2  ( m3, x, clk, reset );
 moore1101  moore1  ( m2, x, clk, reset );
 moore1010  moore2  ( m4, x, clk, reset );
 mealy0111  mealy3  ( m5, x ,clk, reset );
 
 initial 
  begin 
   $display ( "Time     X   Mealy Moore  X Me(101) X Mo(1010) X Me(0111)" );
 
// initial values 
       clk    = 1; 
       reset = 0; 
       x       = 0; 
 
// input signal changing 
  #5    reset = 1;
  #10  x = 1;
  #10  x = 0;
  #10  x = 1;
  #10  x = 0;
  #10  x = 1; 
  #10  x = 1; 
  #10  x = 0; 
  #10  x = 1; 
 
  #30 $finish; 
 end // initial 
 
 always 
  #5 clk = ~clk; 
 
 always @( posedge clk ) 
  begin 
   $display ( "%4d  %4b  %4b %5b \t \t%4b \t%5b \t   %4b ", $time, x, m1, m2 , m3, m4, m5 );
  end // always at positive edge clocking changing 
 
endmodule // Exemplo0051