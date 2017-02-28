// ------------------------- 
// Exemplo0044 – CLOCK
// Nome: Julio Machado	 
// Matricula: 435666
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
   #24 clk = ~clk; 
  end 
 
endmodule // clock ( ) 
 
module Exemplo0044; 
 
 wire  clk; 
 clock CLK1 ( clk ); 
 
 initial begin 
  $dumpfile ( "D:\Meus Documentos\Desktop\Guias\Guia 06\Exemplo0044.vcd" ); 
  $dumpvars; 
 
  #120 $finish; 
 end 
 
endmodule // Exemplo044 ( ) 