// --------------------------- 
// -- test clock generator (3) 
// --------------------------- 
`include "clock.v" 
module pulse ( signal, clock ); 
input clock; 
output signal; 
reg signal; 
always @ ( clock ) 
begin 
signal = 1'b1; 
#4 signal = 1'b0; 
#4 signal = 1'b1; 
#4 signal = 1'b0; 
#4 signal = 1'b1;  
end 
endmodule // pulse
 
module Exemplo0044; 
wire clock; 
clock clk ( clock ); 
wire p1; 
pulse pls1 ( p1, clock ); 
initial begin 
$dumpfile ( "Exemplo044.vcd" ); 
$dumpvars ( 1, clock, p1 ); 
#120 $finish; 
end 
endmodule // Exemplo0043 