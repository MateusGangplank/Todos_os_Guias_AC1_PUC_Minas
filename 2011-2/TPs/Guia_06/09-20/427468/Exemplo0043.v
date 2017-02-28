// ---------------------------
// Exemplo0043
// Nome: Ursula Rosa Monteiro de Castro
// Matricula: 427468  

// --------------------------- 
// -- test clock generator (3) 
// --------------------------- 
`include "clock.v" 

module pulse1 ( signal, clock ); 
input clock; 
output signal; 
reg signal; 

always @ ( posedge clock ) begin 
signal = 1'b1; 
#4 signal = 1'b0; 
#4 signal = 1'b1; 
#4 signal = 1'b0; 
#4 signal = 1'b1; 
#4 signal = 1'b0; 
end 

endmodule // pulse
 
module pulse2 ( signal, clock ); 
input clock; 
output signal; 
reg signal; 

always @ ( posedge clock ) begin 
signal = 1'b1; 
#5 signal = 1'b0; 
end 

endmodule // pulse 

module pulse3 ( signal, clock ); 
input clock; 
output signal; 
reg signal; 

always @ ( negedge clock ) begin 
signal = 1'b1; 
#15 signal = 1'b0; 
#15 signal = 1'b1; 
end 

endmodule // pulse 

module pulse4 ( signal, clock ); 
input clock; 
output signal; 
reg signal; 
always @ ( negedge clock ) begin 
signal = 1'b1; 
#20 signal = 1'b0; 
#20 signal = 1'b1; 
#20 signal = 1'b0; 
end 

endmodule // pulse 

module Exemplo0043; 
wire clock; 
clock clk ( clock ); 
wire p1,p2,p3,p4; 
pulse1 pls1 ( p1, clock ); 
pulse2 pls2 ( p2, clock ); 
pulse3 pls3 ( p3, clock ); 
pulse4 pls4 ( p4, clock ); 

initial begin 
$display("Exemplo0043- Ursula Rosa - 427468");
$dumpfile ( " Exemplo0043.vcd" ); 
$monitor($time,  p1,  p2,  p3,  p4,  clock);
$dumpvars ( 1, clock, p1, p2, p3, p4 ); 
#480 $finish; 
end 

endmodule // Exemplo0043 


/*
				

                       0 x x x x 0
                      12 1 1 x x 1
                      16 0 1 x x 1
                      17 0 0 x x 1
                      20 1 0 x x 1
                      24 0 0 1 1 0
                      28 1 0 1 1 0
                      32 0 0 1 1 0
                      36 1 1 1 1 1
                      39 1 1 0 1 1
                      40 0 1 0 1 1
                      41 0 0 0 1 1
                      44 1 0 0 0 1
                      48 0 0 0 0 0
                      52 1 0 0 0 0
                      54 1 0 1 0 0
                      56 0 0 1 0 0
                      60 1 1 1 0 1
                      64 0 1 1 1 1
                      65 0 0 1 1 1
                      68 1 0 1 1 1
                      72 0 0 1 1 0
                      76 1 0 1 1 0
                      80 0 0 1 1 0
                      84 1 1 1 0 1
                      87 1 1 0 0 1
                      88 0 1 0 0 1
                      89 0 0 0 0 1
                      92 1 0 0 0 1
                      96 0 0 0 1 0
                     100 1 0 0 1 0
                     102 1 0 1 1 0
                     104 0 0 1 1 0
                     108 1 1 1 1 1
                     112 0 1 1 1 1
                     113 0 0 1 1 1
                     116 1 0 1 0 1
                     120 0 0 1 0 0
                     124 1 0 1 0 0
                     128 0 0 1 0 0
                     132 1 1 1 0 1
                     135 1 1 0 0 1
                     136 0 1 0 1 1
                     137 0 0 0 1 1
                     140 1 0 0 1 1
                     144 0 0 0 1 0
                     148 1 0 0 1 0
                     150 1 0 1 1 0
                     152 0 0 1 1 0
                     156 1 1 1 0 1
                     160 0 1 1 0 1
                     161 0 0 1 0 1
                     164 1 0 1 0 1
                     168 0 0 1 1 0
                     172 1 0 1 1 0
                     176 0 0 1 1 0
                     180 1 1 1 1 1
                     183 1 1 0 1 1
                     184 0 1 0 1 1
                     185 0 0 0 1 1
                     188 1 0 0 0 1
                     192 0 0 0 0 0
                     196 1 0 0 0 0
                     198 1 0 1 0 0
                     200 0 0 1 0 0
                     204 1 1 1 0 1
                     208 0 1 1 1 1
                     209 0 0 1 1 1
                     212 1 0 1 1 1
                     216 0 0 1 1 0
                     220 1 0 1 1 0
                     224 0 0 1 1 0
                     228 1 1 1 0 1
                     231 1 1 0 0 1
                     232 0 1 0 0 1
                     233 0 0 0 0 1
                     236 1 0 0 0 1
                     240 0 0 0 1 0
                     244 1 0 0 1 0
                     246 1 0 1 1 0
                     248 0 0 1 1 0
                     252 1 1 1 1 1
                     256 0 1 1 1 1
                     257 0 0 1 1 1
                     260 1 0 1 0 1
                     264 0 0 1 0 0
                     268 1 0 1 0 0
                     272 0 0 1 0 0
                     276 1 1 1 0 1
                     279 1 1 0 0 1
                     280 0 1 0 1 1
                     281 0 0 0 1 1
                     284 1 0 0 1 1
                     288 0 0 0 1 0
                     292 1 0 0 1 0
                     294 1 0 1 1 0
                     296 0 0 1 1 0
                     300 1 1 1 0 1
                     304 0 1 1 0 1
                     305 0 0 1 0 1
                     308 1 0 1 0 1
                     312 0 0 1 1 0
                     316 1 0 1 1 0
                     320 0 0 1 1 0
                     324 1 1 1 1 1
                     327 1 1 0 1 1
                     328 0 1 0 1 1
                     329 0 0 0 1 1
                     332 1 0 0 0 1
                     336 0 0 0 0 0
                     340 1 0 0 0 0
                     342 1 0 1 0 0
                     344 0 0 1 0 0
                     348 1 1 1 0 1
                     352 0 1 1 1 1
                     353 0 0 1 1 1
                     356 1 0 1 1 1
                     360 0 0 1 1 0
                     364 1 0 1 1 0
                     368 0 0 1 1 0
                     372 1 1 1 0 1
                     375 1 1 0 0 1
                     376 0 1 0 0 1
                     377 0 0 0 0 1
                     380 1 0 0 0 1
                     384 0 0 0 1 0
                     388 1 0 0 1 0
                     390 1 0 1 1 0
                     392 0 0 1 1 0
                     396 1 1 1 1 1
                     400 0 1 1 1 1
                     401 0 0 1 1 1
                     404 1 0 1 0 1
                     408 0 0 1 0 0
                     412 1 0 1 0 0
                     416 0 0 1 0 0
                     420 1 1 1 0 1
                     423 1 1 0 0 1
                     424 0 1 0 1 1
                     425 0 0 0 1 1
                     428 1 0 0 1 1
                     432 0 0 0 1 0
                     436 1 0 0 1 0
                     438 1 0 1 1 0
                     440 0 0 1 1 0
                     444 1 1 1 0 1
                     448 0 1 1 0 1
                     449 0 0 1 0 1
                     452 1 0 1 0 1
                     456 0 0 1 1 0
                     460 1 0 1 1 0
                     464 0 0 1 1 0
                     468 1 1 1 1 1
                     471 1 1 0 1 1
                     472 0 1 0 1 1
                     473 0 0 0 1 1
                     476 1 0 0 0 1
                     480 0 0 0 0 0

*/