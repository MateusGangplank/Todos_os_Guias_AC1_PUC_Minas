// ------------------------- 
// Exemplo0031 – CLOCK
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
   #12 clk = ~clk; 
  end 
 
endmodule // clock ( ) 
 
module Exemplo0041; 
 
 wire  clk; 
 clock CLK1 ( clk ); 
 
 initial begin 
  $dumpfile ( "G:/PenDrive/PUC/2periodo/AC/Guia06/Exemplo041.vcd" ); 
  $dumpvars; 
 
  #120 $finish; 
 end 
 
endmodule // Exemplo041 ( ) 