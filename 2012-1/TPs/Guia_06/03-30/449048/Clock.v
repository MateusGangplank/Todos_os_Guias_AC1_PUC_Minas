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
module Exemplo041; 
wire clk; 
clock CLK1 ( clk ); 
initial begin 
$dumpfile ( "Clock.vcd" ); 
$dumpvars; 
#120 $finish; 
end 
endmodule // Clock