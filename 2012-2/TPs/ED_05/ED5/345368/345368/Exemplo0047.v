// ------------------------- 
// Exemplo0047 - test clock generator
// Nome: Marcio Santana Correa
// Matricula: 345368
// -------------------------

`include "clock.v"
 
module pulse ( signal, clock ); 
input clock; 
output signal; 
reg signal; 

always @ ( clock ) begin 
signal = 1'b0; 
#6 signal = 1'b0; 
#6 signal = 1'b0; 
#6 signal = 1'b1; 
end 

endmodule // pulse 

module Exemplo0047; 
wire clock; 
clock clk ( clock ); 
reg p; 
wire p1; 
pulse pulse1 ( p1, clock ); 

initial begin 
p = 1'b0; 
end 

initial begin 
$display("Exemplo0047 - Marcio Santana Correa	345368");
$dumpfile ( "Exemplo0047.vcd" );
$display("Tempo - Clock - Pulso");
$monitor($time,,clock,,p1,,p); 
$dumpvars ( 1, clock, p1, p); 

#240 $finish;
 
end 
endmodule // Exemplo0047