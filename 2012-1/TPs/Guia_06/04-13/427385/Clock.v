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
  
