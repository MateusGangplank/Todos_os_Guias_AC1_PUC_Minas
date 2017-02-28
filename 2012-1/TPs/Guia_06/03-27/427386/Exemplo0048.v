// -------------------------
// Exemplo0048 – Gerador de pulsos
// Nome: Andre Henriques Fernandes
// Matricula: 427386
// ------------------------- 

// --------------------------- 
// -- test clock generator EXTRA
// --------------------------- 
 
`include "clock.v" 
 
module pulse1 ( signal, clock ); 
 input   clock; 
 output signal; 
 reg      signal; 
 
 always @ ( clock )
	begin 
       signal = 1'b0; 
  #6  signal = 1'b0; 
  #6  signal = 1'b1; 
  #6  signal = 1'b1; 
	end 
endmodule // pulse 
 

module Exemplo0048; 
 
 wire  clock, p1; 
 clock clk ( clock ); 
 reg p = 1'b0; 
  
 pulse1 pulseA(p1, clock);
 
 initial begin
  //identificar
  $display ("EXEMPLO0048 - Andre Henriques Fernandes - 427386");	  
  $dumpfile ( "Exemplo0048.vcd" ); 
  $dumpvars ( 1, clock, p1, p); 
 
 	 
	#240 $finish; 
 end 
 
endmodule // Exemplo0048 