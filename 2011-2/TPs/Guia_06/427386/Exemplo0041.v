// ------------------------- 
// Exemplo0041 – CLOCK
// Nome: André Henriques Fernandes
// Matricula: 427386
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
  $dumpfile ( "D:\Meus Documentos\Desktop\Guias\Guia 06\Exemplo0041.vcd" ); 
  $dumpvars; 
 
  #120 $finish; 
 end 
 
endmodule // Exemplo041 ( ) 