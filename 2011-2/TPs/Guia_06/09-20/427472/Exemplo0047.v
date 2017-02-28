// -------------------------
// Guia 06 - Exemplo0047.v
// Nome: Wender Zacarias Xavier 
// Matricula: 427472 
// ------------------------- 

// --------------------------- 
// -- Clock generator 
// --------------------------- 

`include "clock.v" 

// --------------------------- 
// -- Pulse generator 
// --------------------------- 

module pulse1 ( signal, clock ); 
  input            clock; 
  output signal; 
  reg   signal; 
  
 initial begin 
 signal = 1'b0; 
   end 

  always  
    begin
#72  signal = ~signal; 

   end 
endmodule // pulse 

// --------------------------- 
// -- Module Exemplo0047 
// --------------------------- 

 module Exemplo0047; 

        wire  clock; 
        clock clk ( clock ); 

        wire  p1; 

        pulse1    pls1   ( p1, clock ); 


        initial begin 
		   $display ("Exemplo0047.v - Wender Zacarias Xavier - 427472");
  			$display ("Test Different Frequence Generator");
         $dumpfile ( "Exemplo0047.vcd" ); 
         $dumpvars ( 1, clock, p1); 

#500 $finish; 

        end 

  endmodule // Exemplo0047 
