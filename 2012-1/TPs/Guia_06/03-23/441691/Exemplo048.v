// FAVOR COLOCAR NOME E MATRICULA
// ---------------------------
// -- test clock generator (3) 
// --------------------------- 
`include "clock.v" 
module pulse ( signal, clock ); 
input clock; 
output signal; 
reg signal; 
always @ ( posedge clock ) 
begin 
signal = 1'b1; 
#5 signal = 1'b0; 
#5 signal = 1'b1; 
end 
always @ ( negedge clock ) 
begin 
signal = 1'b1; 
#5 signal = 1'b0; 
#5 signal = 1'b1; 
end 
endmodule // pulse
 
module Exemplo0048; 
wire clock; 
clock clk ( clock ); 
wire p1; 
pulse pls1 ( p1, clock ); 
initial begin 
$dumpfile ( "Exemplo048.vcd" ); 
$dumpvars ( 1, clock, p1 ); 
#120 $finish; 
end 
endmodule // Exemplo0048 