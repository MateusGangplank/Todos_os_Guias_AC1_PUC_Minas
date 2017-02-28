// ------------------------- 
// Exemplo0041 - Clock
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// -------------------------

// --------------------------- 
// -- test clock generator (1) 
// --------------------------- 

// ------------------------- module clock
   module clock ( clk ); 
     output clk; 
     reg clk; 
 
    initial begin 
      clk = 1'b0; 
    end 
	  
    always begin 
 #12 clk = ~clk; 
     end 

  endmodule // clock ( ) 
  
// ------------------------- module Exemplo0041  
  
   module Exemplo0041; 
     wire clk; 
     clock CLK1 ( clk ); 

    initial begin 
      $dumpfile ( "Exemplo0041.vcd" ); 
      $dumpvars; 
 #120 $finish; 
    end
	   
  endmodule // Exemplo041 ( ) 