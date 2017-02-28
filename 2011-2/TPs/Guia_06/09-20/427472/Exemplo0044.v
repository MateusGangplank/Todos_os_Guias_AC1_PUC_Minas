// -------------------------
// Guia 06 - Exemplo0044.v
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

  always @ ( posedge clock ) 
    begin 
     signal = 1'b1; 
#24  signal = 1'b0; 
#24  signal = 1'b1; 
#24  signal = 1'b0;
#24  signal = 1'b1; 
#24  signal = 1'b0; 
#24  signal = 1'b1; 
#24  signal = 1'b0; 
#24  signal = 1'b1; 
#24  signal = 1'b0; 
#24  signal = 1'b1;  

   end 
endmodule // pulse 

// --------------------------- 
// -- Module Exemplo0044 
// --------------------------- 

 module Exemplo0044; 

        wire  clock; 
        clock clk ( clock ); 

        wire  p1; 

        pulse1    pls1   ( p1, clock ); 


        initial begin 
		   $display ("Exemplo0044.v - Wender Zacarias Xavier - 427472");
  			$display ("Test Different Frequence Generator");
         $dumpfile ( "Exemplo0044.vcd" ); 
         $dumpvars ( 1, clock, p1); 

#480 $finish; 

        end 

  endmodule // Exemplo0044 