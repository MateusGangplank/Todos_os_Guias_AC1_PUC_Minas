// -------------------------
// Exemplo0044 – Gerador de pulsos
// Nome: Andre Henriques Fernandes
// Matricula: 427386
// ------------------------- 

// --------------------------- 
// -- test clock generator (4) 
// --------------------------- 
 
`include "clock.v" 
 
module pulse1 ( signal, clock ); 
 input   clock; 
 output signal; 
 reg      signal; 
 
 always @ ( clock )
	begin 
       signal = 1'b1; 
  #24  signal = 1'b0; 
  #24  signal = 1'b1; 
  #24  signal = 1'b0; 
	end 
endmodule // pulse 
 

module Exemplo0044; 
 
 wire  clock, p1; 
 clock clk ( clock ); 
 reg p = 1'b0; 
  
 pulse1 pulseA(p1, clock);
 
 initial begin
   $display ("EXEMPLO0044 - Andre Henriques Fernandes - 427386");	  
  $dumpfile ( "Exemplo0044.vcd" ); 
  $dumpvars ( 1, clock, p1, p);  
 	
	#060 p = 1'b1;
	#120 p = 1'b0; 
	#180 p = 1'b1;
	#240 p = 1'b0; 
	#300 p = 1'b1; 
	#360 p = 1'b0;  
	#420 $finish; 
 end 
 
endmodule // Exemplo0044 
 