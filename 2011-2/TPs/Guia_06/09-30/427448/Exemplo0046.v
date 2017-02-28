// ------------------------- 
// Exemplo0042 - Clock
// Nome: Michelle da Costa Silva 
// Matricula: 427448
// -------------------------

// --------------------------- 
// -- test clock generator (4) 
// --------------------------- 
   
// ------------------------- modulo clock	
	 module clock ( clk ); 
      output clk; 
      reg clk; 

     initial begin 
       clk = 1'b0; 
     end 

     always begin 
 #6 clk = ~clk; 
     end 
 
    endmodule 
 
// ------------------------- module pulse 
    module pulse ( signal, clock ); 
      input clock; 
      output signal; 
      reg signal; 

     always @ ( clock ) begin 
        signal = 1'b1; 
     #3 signal = 1'b0; 
     #3 signal = 1'b1; 
     #3 signal = 1'b0; 
        end 
		  
    endmodule // pulse 

// ------------------------- module Exemplo0042	

   module Exemplo0042; 
    wire clock; 
    clock clk ( clock ); 
    reg p; 
    wire p1,t1; 
    pulse pulse1 ( p1, clock ); 

    initial begin 
     p = 1'b0; 
    end 

    initial begin 
     $dumpfile ( "Exemplo0046.vcd" ); 
     $dumpvars ( 1, clock, p1 ); 
#060 p = 1'b1; 
#120 p = 1'b0; 
#180 p = 1'b1; 
#240 p = 1'b0; 
#300 p = 1'b1; 
#360 p = 1'b0; 
#376 $finish; 
     end 
   endmodule // Exemplo0042 