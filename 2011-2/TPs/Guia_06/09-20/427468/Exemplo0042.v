// ---------------------------
// Exemplo0042
// Nome: Ursula Rosa Monteiro de Castro
// Matricula: 427468  

// --------------------------- 
// -- test clock generator (2) 
// --------------------------- 
module clock ( clk ); 
output clk; 
reg clk; 
initial begin 
clk = 1'b0; 
end
 
always begin 
#12 clk = ~clk; 
end 

endmodule
 
module pulse ( signal, clock ); 
input clock; 
output signal; 
reg signal; 

always @ ( clock ) begin 
signal = 1'b1; 
#3 signal = 1'b0; 
#3 signal = 1'b1; 
#3 signal = 1'b0; 
end 

endmodule // pulse 

module trigger ( signal, on, clock ); 
input on, clock; 
output signal; 
reg signal; 
always @ ( posedge clock & on ) begin 
#60 signal = 1'b1; 
#60 signal = 1'b0; 
end 

endmodule // trigger 

module Exemplo0042; 
wire clock; 
clock clk ( clock ); 
reg p; 
wire p1,t1; 
pulse pulse1 ( p1, clock ); 
trigger trigger1 ( t1, p, clock ); 
initial begin 
p = 1'b0; 
end 

initial begin 
$display("Exemplo0042- Ursula Rosa - 427468");
$dumpfile ( "Exemplo0042.vcd" );
$monitor($time, p, clock); 
$dumpvars ( 1, clock, p1, p, t1 ); 
#060 p = 1'b1; 
#120 p = 1'b0; 
#180 p = 1'b1; 
#240 p = 1'b0; 
#300 p = 1'b1; 
#360 p = 1'b0; 
#376 $finish; 
end 
endmodule // Exemplo0042 

/*					
                       0 0 0
                      12 0 1
                      24 0 0
                      36 0 1
                      48 0 0
                      60 1 1
                      72 1 0
                      84 1 1
                      96 1 0
                     108 1 1
                     120 1 0
                     132 1 1
                     144 1 0
                     156 1 1
                     168 1 0
                     180 0 1
                     192 0 0
                     204 0 1
                     216 0 0
                     228 0 1
                     240 0 0
                     252 0 1
                     264 0 0
                     276 0 1
                     288 0 0
                     300 0 1
                     312 0 0
                     324 0 1
                     336 0 0
                     348 0 1
                     360 1 0
                     372 1 1
                     384 1 0
                     396 1 1
                     408 1 0
                     420 1 1
                     432 1 0
                     444 1 1
                     456 1 0
                     468 1 1
                     480 1 0
                     492 1 1
                     504 1 0
                     516 1 1
                     528 1 0
                     540 1 1
                     552 1 0
                     564 1 1
                     576 1 0
                     588 1 1
                     600 0 0
                     612 0 1
                     624 0 0
                     636 0 1
                     648 0 0
                     660 0 1
                     672 0 0
                     684 0 1
                     696 0 0
                     708 0 1
                     720 0 0
                     732 0 1
                     744 0 0
                     756 0 1
                     768 0 0
                     780 0 1
                     792 0 0
                     804 0 1
                     816 0 0
                     828 0 1
                     840 0 0
                     852 0 1
                     864 0 0
                     876 0 1
                     888 0 0
                     900 1 1
                     912 1 0
                     924 1 1
                     936 1 0
                     948 1 1
                     960 1 0
                     972 1 1
                     984 1 0
                     996 1 1
                    1008 1 0
                    1020 1 1
                    1032 1 0
                    1044 1 1
                    1056 1 0
                    1068 1 1
                    1080 1 0
                    1092 1 1
                    1104 1 0
                    1116 1 1
                    1128 1 0
                    1140 1 1
                    1152 1 0
                    1164 1 1
                    1176 1 0
                    1188 1 1
                    1200 1 0
                    1212 1 1
                    1224 1 0
                    1236 1 1
                    1248 1 0
                    1260 0 1
                    1272 0 0
                    1284 0 1
                    1296 0 0
                    1308 0 1
                    1320 0 0
                    1332 0 1
                    1344 0 0
                    1356 0 1
                    1368 0 0
                    1380 0 1
                    1392 0 0
                    1404 0 1
                    1416 0 0
                    1428 0 1
                    1440 0 0
                    1452 0 1
                    1464 0 0
                    1476 0 1
                    1488 0 0
                    1500 0 1
                    1512 0 0
                    1524 0 1
                    1536 0 0
                    1548 0 1
                    1560 0 0
                    1572 0 1
                    1584 0 0
                    1596 0 1
                    1608 0 0
                    1620 0 1
                    1632 0 0


*/