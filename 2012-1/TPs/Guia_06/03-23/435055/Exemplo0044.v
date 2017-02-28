// -------------------------
// Exemplo00044
// Nome: Samuel Eusébio da Silva
// Matricula: 435055
// ------------------------- 

// --------------------------- 
`include "clock.v"
 
module pulse ( signal, clock ); 
input clock; 
output signal; 
reg signal; 

always @ ( clock ) begin 
signal = 1'b1; 
#24 signal = 1'b0; 
#24 signal = 1'b1; 
#24 signal = 1'b0; 
end 

endmodule // pulse 

module Exemplo0044; 
wire clock; 
clock clk ( clock ); 
reg p; 
wire p1; 
pulse pulse1 ( p1, clock ); 

initial begin 
p = 1'b0; 
end 

initial begin 
$display("Exemplo0044 - Samuel Eusébio da Silva - 435055");
$dumpfile ( "Exemplo0044.vcd" );
$display("Tempo - Clock - Pulso");
$monitor($time, clock, p1, p); 
$dumpvars ( 1, clock, p1, p); 
#060 p = 1'b1; 
#120 p = 1'b0; 
#180 p = 1'b1; 
#240 p = 1'b0; 
#300 p = 1'b1; 
#360 p = 1'b0;  
#376 $finish; 
end

endmodule // Exemplo0044