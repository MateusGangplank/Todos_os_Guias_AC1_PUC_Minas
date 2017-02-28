// ---------------------------
// Exemplo0045
// Nome: Ursula Rosa Monteiro de Castro
// Matricula: 427468  

// --------------------------- 
`include "clock.v"
 
module pulse ( signal, clock ); 
input clock; 
output signal; 
reg signal; 

always @ ( clock ) begin 
signal = 1'b1; 
#4 signal = 1'b0; 
#4 signal = 1'b1; 
#4 signal = 1'b0; 
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
$display("Exemplo0045- Ursula Rosa - 427468");
$dumpfile ( "Exemplo0045.vcd" );
$display("Tempo - Clock - Pulso");
$monitor($time, clock, p1, p); 
$dumpvars ( 1, clock, p1, p); 

#240 $finish; 
end 

endmodule // Exemplo0045 

/*
	
                       0 0 1 0
                       4 0 0 0
                       8 0 1 0
                      12 1 0 0
                      24 0 1 0
                      28 0 0 0
                      32 0 1 0
                      36 1 0 0
                      48 0 1 0
                      52 0 0 0
                      56 0 1 0
                      60 1 0 0
                      72 0 1 0
                      76 0 0 0
                      80 0 1 0
                      84 1 0 0
                      96 0 1 0
                     100 0 0 0
                     104 0 1 0
                     108 1 0 0
                     120 0 1 0
                     124 0 0 0
                     128 0 1 0
                     132 1 0 0
                     144 0 1 0
                     148 0 0 0
                     152 0 1 0
                     156 1 0 0
                     168 0 1 0
                     172 0 0 0
                     176 0 1 0
                     180 1 0 0
                     192 0 1 0
                     196 0 0 0
                     200 0 1 0
                     204 1 0 0
                     216 0 1 0
                     220 0 0 0
                     224 0 1 0
                     228 1 0 0
                     240 0 1 0

*/