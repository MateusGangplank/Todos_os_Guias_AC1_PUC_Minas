// -------------------------
// Guia 06 - Exemplo0048.v
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
#84  signal = ~signal; 

   end 
endmodule // pulse 

// --------------------------- 
// -- Module Exemplo0048 
// --------------------------- 

 module Exemplo0048; 

        wire  clock; 
        clock clk ( clock ); 

        wire  p1; 

        pulse1    pls1   ( p1, clock ); 


        initial begin 
		   $display ("Exemplo0048.v - Wender Zacarias Xavier - 427472");
  			$display ("Test Different Frequence Generator");
         $dumpfile ( "Exemplo0048.vcd" ); 
         $dumpvars ( 1, clock, p1); 

#500 $finish; 

        end 

  endmodule // Exemplo0048 

// Nao entendi se a subida e a descida deveriam estar sincronizadas como
// sendo dois pulsos diferentes, ou esperava 6 unidades de tempo, e na proxima
// que coincidisse descia ou subia(deste jeito eu fiz).