// -------------------------
// Guia 06 - Exemplo0046.v
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
/*
#12  signal = 1'b1;
#72  signal = 1'b1;
     signal = 1'b0;
*/
	end

  always
    begin
#72  signal = 1'b1;
#72  signal = 1'b0;
//#72  signal = 1'b1;

   end
endmodule // pulse 

// --------------------------- 
// -- Module Exemplo0046 
// --------------------------- 

 module Exemplo0046; 

        wire  clock; 
        clock clk ( clock ); 

        wire  p1; 

        pulse1    pls1   ( p1, clock ); 


        initial begin 
		   $display ("Exemplo0046.v - Wender Zacarias Xavier - 427472");
  			$display ("Test Different Frequence Generator");
         $dumpfile ( "Exemplo0046.vcd" ); 
         $dumpvars ( 1, clock, p1); 

#500 $finish; 

        end 

  endmodule // Exemplo0046 
  
  // Meu primeiro pulso, quando eu sincronizo com a borda da subida,
  // esta demorando apenas 5 unidades de tempo,mesmo eu colocando pra mudar
  // de valor apos 6 unidades de tempo
  
  // os outros pulsos estao corretos
  
  // VER SUGESTOES ACIMA