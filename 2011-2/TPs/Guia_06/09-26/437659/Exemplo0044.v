// ------------------------- 
// Exemplo0044 � CLOCK
// Nome: Debora Amaral Chaves 
// Matricula: 437659 
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
  $dumpfile ( "G:/PenDrive/PUC/2periodo/AC/Guia06/Exemplo0044.vcd" ); 
  $dumpvars; 
 
  #120 $finish; 
 end 
 
endmodule // Exemplo044 ( ) 