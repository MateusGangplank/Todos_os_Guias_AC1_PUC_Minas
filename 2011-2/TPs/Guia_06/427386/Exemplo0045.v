// ------------------------- 
// Exemplo0045 – CLOCK
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
   #4 clk = ~clk; 
  end 
 
endmodule // clock ( ) 
 
module Exemplo0045; 
 
 wire  clk; 
 clock CLK1 ( clk ); 
 
 initial begin 
  $dumpfile ( "D:\Meus Documentos\Desktop\Guias\Guia 06\Exemplo0045.vcd" ); 
  $dumpvars; 
 
  #120 $finish; 
 end 
 
endmodule // Exemplo045 ( ) 