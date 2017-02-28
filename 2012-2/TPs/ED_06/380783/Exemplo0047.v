// --------------------------- 
// -- test clock generator (7) 
// --------------------------- 

// ------------------------- 
// Exemplo0047
// Nome: Lucas Siqueira Chagas	
// Matricula: 380783
// ----

`include "exemplo0041_2.v" 

module pulse ( signal, clock ); 

input clock; 
output signal; 
reg signal; 

always @ ( negedge clock ) 
begin 
signal = 1'b1; 
#5 signal = 1'b0; 
 
end 

endmodule // pulse 

module Exemplo0047; 

wire clock; 
clock clk ( clock ); 
reg p; 
wire p1; 
pulse pulse1 ( p1, clock ); 

initial begin 
$dumpfile ( "Exemplo0047.vcd" ); 
$dumpvars ( 1, clock, p1 ); 
#120 $finish; 

end 
endmodule // Exemplo0047
