// -------------------------
// Exemplo0045 – CLOCK
// Nome: Felipe Ferreira Andrade do Carmo	
// Matricula: 427402
// -------------------------
// --------------------------- 
// -- test clock generator (3) 
// --------------------------- 
 
`include "clock.v" 
 
module pulse1 ( signal, clock ); 
 input   clock; 
 output signal; 
 reg      signal; 

 initial
  begin 
   signal= 1'b1;
  end

  always
  begin
  #4 signal = ~signal;
  end
endmodule // pulse 


module Exemplo0043;
 
 wire  clock; 
 clock clk ( clock ); 
 
 wire  p1;

 pulse1   pls1   ( p1, clock );
 
 initial begin

  $dumpfile ( " Exemplo0045.vcd" );
  $dumpvars ( 1, clock, p1 );
 end 
 
endmodule // Exemplo0045