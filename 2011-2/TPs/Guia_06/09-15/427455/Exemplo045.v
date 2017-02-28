// --------------------------- 
// -- test clock generator (3) 
// --------------------------- 
 
`include "clock.v" 
 
module pulse1 ( signal, clock ); 
 input   clock; 
 output signal; 
 reg      signal; 
 
 always @ ( clock ) 
  begin 
        signal = 1'b0; 
  #4  signal = 1'b1;
  #4  signal = 1'b0;
  #4  signal = 1'b1;
  #4  signal = 1'b0;
  #4  signal = 1'b1;         
  end 
endmodule // pulse 
 

 
module Exemplo0045; 
 
 wire  clock; 
 clock clk ( clock ); 
 
 wire  p1; 
 
 pulse1   pls1   ( p1, clock ); 

 
 initial begin
  $display("Exemplo0045 - Pedro Ballona - 427455"); 
  $dumpfile ( "Exemplo045.vcd" ); 
  $dumpvars ( 1, p1, clock ); 
 
  #480 $finish; 
 end 
 
endmodule // Exemplo0043