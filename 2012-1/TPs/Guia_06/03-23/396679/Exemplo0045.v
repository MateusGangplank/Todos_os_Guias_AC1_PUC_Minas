// ------------------------- 
// Exemplo0045 - Pulse com metade do periodo
// Nome: Bruno Cezar Andrade Viallet 
// Matricula: 396679
// ------------------------- 

`include "clock.v"
 
module pulse ( signal, clock ); 
input clock; 
output signal; 
reg signal; 

always @ ( clock ) begin 
signal = 1'b1; 
#6 signal = 1'b0; 
#6 signal = 1'b1; 
#6 signal = 1'b0; 
end 

endmodule // pulse 

module Exemplo0045; 
wire clock; 
clock clk ( clock ); 
reg p; 
wire p1; 
pulse pulse1 ( p1, clock ); 

initial begin 
p = 1'b0; 
end 

initial begin 
$display("Exemplo0045 - Bruno Cezar Andrade Viallet - 396679");
$dumpfile ( "Exemplo0045.vcd" );
$display("Tempo - Clock - Pulso");
$monitor($time,,clock,,p1,,p); 
$dumpvars ( 1, clock, p1, p); 

#240 $finish; 
end 
endmodule // Exemplo0045