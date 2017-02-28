// ---------------------------------------
// Exemplo0047 - Pulse e frequencia 5
// Nome: Alvaro Henrique de Araujo Rungue 
// Matricula: 395487
// --------------------------------------- 

`include "clock.v"
 
module pulse ( signal, clock ); 
input clock; 
output signal; 
reg signal; 

always @ ( clock ) begin 
signal = 1'b1; 
#60 signal = 1'b0; 
#60 signal = 1'b1; 
#60 signal = 1'b0;
#60 signal = 1'b1; 
#60 signal = 1'b0;  
end 

endmodule //--pulse 

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
$display("Exemplo0047 - Alvaro Henrique de Araujo Rungue - 395487\n");
$dumpfile ( "Exemplo0047.vcd" );
$display("Tempo - Clock - Pulso");
$monitor($time,,clock,,p1,,p); 
$dumpvars ( 1, clock, p1, p); 

#240 $finish;
 
end 
endmodule //-- Exemplo0047 
