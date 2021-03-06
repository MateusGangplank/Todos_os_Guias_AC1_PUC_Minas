// -------------------------
// Exemplo0044 � CLOCK
// Nome: Lucas Siqueira Chagas
// Matricula: 380783
// -------------------------
// --------------------------- 
// -- test clock generator (3) 
// --------------------------- 
 
`include "exemplo0041_2.v" 
 
module pulse1 ( signal, clock ); 
 input   clock; 
 output signal; 
 reg      signal; 

 initial
  begin 
   signal= 1'b1;
  end

 always @ (clock )
  begin
  #36  signal = 1'b0;
  #36  signal = 1'b1;
  #36  signal = 1'b0;
  #36  signal = 1'b1;
  #39  signal = 1'b0;
  end 
endmodule // pulse 


module Exemplo0044;
 
 wire  clock; 
 clock clk ( clock ); 
 
 wire  p1;
 
 pulse1   pls1   ( p1, clock );
 
 initial begin 

  $dumpfile ( " Exemplo0044.vcd" );
  $dumpvars ( 1, clock, p1 );
 end 
 
endmodule // Exemplo0043 