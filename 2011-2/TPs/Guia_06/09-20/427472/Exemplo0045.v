// -------------------------
// Guia 06 - Exemplo0045.v
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

  always  
    begin 
    signal = 1'b1; 
#4  signal = 1'b0; 
#4  signal = 1'b1; 

   end 
endmodule // pulse 

// --------------------------- 
// -- Module Exemplo0045 
// --------------------------- 

 module Exemplo0045; 

        wire  clock; 
        clock clk ( clock ); 

        wire  p1; 

        pulse1    pls1   ( p1, clock ); 


        initial begin 
		   $display ("Exemplo0045.v - Wender Zacarias Xavier - 427472");
  			$display ("Test Different Frequence Generator");
         $dumpfile ( "Exemplo0045.vcd" ); 
         $dumpvars ( 1, clock, p1); 

#480 $finish; 

        end 

  endmodule // Exemplo0045 