// ------------------------- 
// Exemplo0041
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 
// --------------------------- 
// -- test clock generator (1) 
// --------------------------- 
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
// ------------- Test -------- 
module Teste; 
wire clk; 
clock CLK1 ( clk ); 
initial begin 
$dumpfile ( "Exemplo041.vcd" ); 
$dumpvars; 
#120 $finish; 
end 
endmodule 