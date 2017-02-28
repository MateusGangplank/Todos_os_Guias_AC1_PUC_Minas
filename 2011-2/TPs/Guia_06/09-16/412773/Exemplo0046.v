// ---------------------------
// Nome: Silvino Henrique Santos de Souza
//Matricula: 412773 - Exercicio06 - Guia06
// --------------------------- 
`include "clock.v"
 
module pulse ( signal, clock ); 
input clock; 
output signal; 
reg signal; 

always @ ( clock ) begin 
signal = 1'b0; 
#6 signal = 1'b0; 
#6 signal = 1'b1; 
#6 signal = 1'b0; 
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
$display("Exercicio 06 - Silvino Henrique Santos de Souza - Matricula: 412773");
$dumpfile ( "Exemplo0046.vcd" );
$display("Tempo - Clock - Pulso");
$monitor($time,,clock,,p1,,p); 
$dumpvars ( 1, clock, p1, p); 

#240 $finish; 
end 
endmodule // Exemplo0045 
