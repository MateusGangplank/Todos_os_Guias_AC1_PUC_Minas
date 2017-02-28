// -------------------------
// Exemplo0041 – Gerador de clock
// Nome: Andre Henriques Fernandes
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
 $display ("EXEMPLO0041 - Andre Henriques Fernandes - 427386");	   
  $dumpfile ( "Exemplo0041.vcd" );
  $dumpvars; 

  #120 $finish; 
 end 

endmodule // Exemplo041 ( ) 
