 // -------------------------
// Exemplo0041 – CLOCK
// Nome: Felipe Ferreira Andrade do Carmo	
// Matricula: 427402
// -------------------------

// --------------------------- 
// -- test clock generator (1) 
// --------------------------- 
 
module clock ( clk ); 
 output clk; 
 reg      clk; 
 
 initial 
  begin 
   clk = 1'b0; 
  end 
 
 always 
  begin 
   #12 clk = ~clk;
  end 
 
endmodule // clock ( ) 

module Exemplo0041; 
 
 wire  clk; 
 clock CLK1 ( clk ); 
 
 initial begin 
  $dumpfile ( "Exemplo041.vcd" ); 
  $dumpvars;

  #120 $finish; 
 end 
 
endmodule // Exemplo041 ( ) 