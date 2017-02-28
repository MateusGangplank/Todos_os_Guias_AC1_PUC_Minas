// --------------------------- 
// -- Exemplo 0047
// --------------------------- 
`include "Clock.v"

module pulse ( signal, clock ); 
input clock; 
output signal; 
reg signal; 
always @ ( clock ) 
begin 
signal = 1'b0;
#2 signal = 1'b1;
#2 signal = 1'b0;
#2 signal = 1'b1;
#2 signal = 1'b0;
#2 signal = 1'b1;
#2 signal = 1'b0;




end 
endmodule // pulse

module Exemplo047; 
wire clock; 
clock clk ( clock ); 
wire p1; 
pulse pulse1 ( p1, clock ); 
 
initial begin 
$dumpfile ( "Exemplo047.vcd" ); 
$dumpvars ( 1, clock, p1 ); 
#480 $finish; 
end 
endmodule // Exemplo047 