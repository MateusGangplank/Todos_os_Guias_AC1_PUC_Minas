// ---------------------------
// Exemplo0047 - EXTRA
// Nome: Ursula Rosa Monteiro de Castro
// Matricula: 427468 

// --------------------------- 
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
$display("Exemplo0047- Ursula Rosa - 427468");
$dumpfile ( "Exemplo0047.vcd" );
$display("Tempo - Clock - Pulso");
$monitor($time, clock, p1, p); 
$dumpvars ( 1, clock, p1, p); 

#240 $finish;
 
end 

endmodule // Exemplo0047 

/*
	
                       0 0 0 0
                      12 1 0 0
                      18 1 1 0
                      24 0 0 0
                      36 1 0 0
                      42 1 1 0
                      48 0 0 0
                      60 1 0 0
                      66 1 1 0
                      72 0 0 0
                      84 1 0 0
                      90 1 1 0
                      96 0 0 0
                     108 1 0 0
                     114 1 1 0
                     120 0 0 0
                     132 1 0 0
                     138 1 1 0
                     144 0 0 0
                     156 1 0 0
                     162 1 1 0
                     168 0 0 0
                     180 1 0 0
                     186 1 1 0
                     192 0 0 0
                     204 1 0 0
                     210 1 1 0
                     216 0 0 0
                     228 1 0 0
                     234 1 1 0
                     240 0 0 0

*/