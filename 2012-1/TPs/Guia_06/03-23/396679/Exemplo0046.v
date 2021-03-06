// ------------------------- 
// Exemplo0046 - Pulse Com Frequencia igual 5 unidades de tempo sincronizado com borda de subida
// Nome: Bruno Cezar Andrade Viallet 
// Matricula: 396679
// -------------------------
`include "clock.v"
 
module pulse ( signal, clock ); 
input clock; 
output signal; 
reg signal; 

always @ ( clock ) begin 
    signal = 1'b0; 
#60 signal = 1'b1; 
#60 signal = 1'b0; 
#60 signal = 1'b1; 
#60 signal = 1'b0; 
#60 signal = 1'b1; 
end 

endmodule // pulse 

module Exemplo0046; 
wire clock; 
clock clk ( clock ); 
reg p; 
wire p1; 
pulse pulse1 ( p1, clock ); 

initial begin 
p = 1'b0; 
end 

initial begin 
$display("Exemplo0046 - Bruno Cezar Andrade Viallet - 396679");
$dumpfile ( "Exemplo0046.vcd" );
$display("Tempo - Clock - Pulso");
$monitor($time,,clock,,p1,,p); 
$dumpvars ( 1, clock, p1, p); 

#240 $finish; 
end 
endmodule // Exemplo0046

