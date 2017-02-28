// --------------------------- 
// -- test clock generator (1) 
// --------------------------- 
// Nome: Rayan Darwin
// Matricula: 412770

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
endmodule 
module Exemplo0041; 
wire clk; 
clock CLK1 ( clk ); 
initial begin 
#120 $finish; 
end 
endmodule 