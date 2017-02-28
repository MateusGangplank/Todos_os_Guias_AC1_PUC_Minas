// --------------------------- 
// -- test clock generator (1x3) 
// -- JOSÉ F. R. FONSECA - 405808
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
 
module Exemplo0045 (signal, clock); 
 
 input  clock; 
 output signal; 
 reg      signal; 
 wire  clk; 
 clock CLK1 ( clk ); 

 always @ ( clock ) 
  begin 
  
  $dumpfile ( "Exemplo045.vcd");
  $dumpvars;
  
      signal = 1'b1; 
  #1  signal = 1'b0; 
  #1  signal = 1'b1; 
  #1  signal = 1'b0; 
 
  #120 $finish; 
 end 
 
endmodule // Exemplo045 ( ) 