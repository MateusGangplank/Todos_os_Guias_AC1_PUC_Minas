// --------------------------- 
// -- Exemplo 0045
// --------------------------- 
`include "Clock.v"

module pulse ( signal, clock ); 
input clock; 
output signal; 
reg signal; 
always @ ( clock ) 
begin 
signal = 1'b0; 
#6 signal = 1'b1;
#6 signal = 1'b0;
#6 signal = 1'b1;
#6 signal = 1'b0;
#6 signal = 1'b1;
#6 signal = 1'b0;
#6 signal = 1'b1;

end 
endmodule // pulse 


module Exemplo045; 
wire clock; 
clock clk ( clock ); 
wire p2; 
pulse pulse2 ( p2, clock ); 
 
initial begin 
$dumpfile ( "Exemplo045.vcd" ); 
$dumpvars ( 1, clock, p2 ); 
#480 $finish; 
end 
endmodule // Exemplo045 