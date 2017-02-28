// -------------------------
// Exemplo0045 – CLOCK
// Nome: Luis Vasconcelos Dias	
// Matricula: 412753
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
   signal = 1'b0;
   end

 always @ ( posedge clock ) 
  begin 
      signal = 1'b1;
  #6  signal = 1'b0;

  end
endmodule // pulse


module Exemplo0043;
 
 wire  clock; 
 clock clk ( clock ); 
 
 wire  p1;

 pulse1   pls1   ( p1, clock );
 
 initial begin

   $dumpfile ( " Exemplo0043.vcd" );
  $dumpvars ( 1, clock, p1); 

  #480 $finish;
 end 
 
endmodule // Exemplo0045