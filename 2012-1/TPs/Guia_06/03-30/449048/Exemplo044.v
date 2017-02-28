// --------------------------- 
// -- Exemplo 0044
// --------------------------- 
`include "Clock.v"

module pulse ( signal, clock ); 
input clock; 
output signal; 
reg signal; 
always @ ( clock ) 
begin 
signal = 1'b0; 
#4 signal = 1'b1;
#4 signal = 1'b0;
#4 signal = 1'b1;
#4 signal = 1'b0;
#4 signal = 1'b1;
end 
endmodule // pulse 


module Exemplo044; 
wire clock; 
clock clk ( clock ); 
wire p3; 
pulse pulse3 ( p3, clock ); 
 
initial begin 
$dumpfile ( "Exemplo044.vcd" ); 
$dumpvars ( 1, clock, p3 ); 
#480 $finish; 
end 
endmodule // Exemplo044 