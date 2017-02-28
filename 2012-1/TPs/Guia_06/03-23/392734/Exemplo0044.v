// ------------------------- 
// Exemplo0044 - test clock generator
// Nome: Jo�o Henrique Mendes de Oliveira
// Matricula: 392734
// -------------------------

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
$display("Exemplo0044 - Jo�o Henrique - Matricula: 392734");
$dumpfile ( "Exemplo0044.vcd" );
$display("Tempo - Clock - Pulso");
$monitor($time,,clock,,p1,,p); 
$dumpvars ( 1, clock, p1, p); 
 
#376 $finish; 
end 
endmodule // Exemplo0044