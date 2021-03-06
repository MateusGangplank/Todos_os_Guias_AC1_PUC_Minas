// ------------------------- 
// Exemplo0045 - CLOCK 
// Nome: Guilherme Andrade Salum Terra 
// Matricula: 427407
// ------------------------- 

// --------------------------- 
// -- test clock generator (4) 
// --------------------------- 
`include "clock.v" 

module pulse1 ( signal, clock ); 
input clock; 
output signal; 
reg signal; 

always @ ( posedge clock ) 
begin 
   signal = 1'b1; 
#4 signal = 1'b0; 
#4 signal = 1'b1; 
#4 signal = 1'b0; 
#4 signal = 1'b1; 
#4 signal = 1'b0; 
end 
endmodule // pulse 

module Exemplo0045; 

wire clock; 
clock clk ( clock ); 

wire p1;

pulse1 pls1 ( p1, clock ); 


initial begin 
$dumpfile ( " Exemplo0045.vcd" ); 
$dumpvars ( 1, clock, p1 ); 

#480 $finish; 
end 

endmodule // Exemplo0045 