// ------------------------- 
// Exemplo0041 - Clock
// Nome: Michelle da Costa Silva 
// Matricula: 427448
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
  
