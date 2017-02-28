 // ------------------------- 
// Exemplo0041 - Test Clock Generator 
// Nome: Lucas Cardoso 
// Matricula: 441694 
// ------------------------- 
// ------------------------- 
module clock ( clk ); 
output clk; 
reg clk; 

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
wire clk; 
clock CLK1 ( clk ); 

// ------------------------- parte principal 
initial 
begin 
$dumpfile ( "Exemplo0041.vcd" ); 
$dumpvars; 
#120 $finish; 
end 

endmodule // Exemplo0041 ( ) 
