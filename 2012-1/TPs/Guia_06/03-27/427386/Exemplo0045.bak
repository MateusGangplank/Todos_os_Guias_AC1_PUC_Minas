// -------------------------
// Exemplo0045 – Gerador de pulsos
// Nome: Jenifer Henrique Moreira Borges
// Matricula: 427420
// ------------------------- 

// --------------------------- 
// -- test clock generator (5) 
// --------------------------- 
 
`include "clock.v" 
 
module pulse1 ( signal, clock ); 
 input   clock; 
 output signal; 
 reg      signal; 
 
 always @ ( clock )
	begin 
       signal = 1'b1; 
  #4  signal = 1'b0; 
  #4  signal = 1'b1; 
  #4  signal = 1'b0; 
	end 
endmodule // pulse 
 

module Exemplo0045; 
 
 wire  clock, p1; 
 clock clk ( clock ); 
 reg p = 1'b0; 
  
 pulse1 pulseA(p1, clock);
 
 initial begin
   $display ("EXEMPLO0045 Jenifer Henrique - 427420");	  
  $dumpfile ( "Exemplo0045.vcd" ); 
  $dumpvars ( 1, clock, p1, p);  
 	 
	#240 $finish; 
 end 
 
endmodule // Exemplo0045 
 