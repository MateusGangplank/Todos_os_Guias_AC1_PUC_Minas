//--------------------
//Rafael Lopes Barbosa
//435052
//--------------------
 `include "clock.v"
 
 module pulse(signal, clock);
 input clock;
 output signal;
 reg signal;
 
 
 always @(clock) begin
 signal = 1'b0;
 #6 signal = 1'b0;
 #6 signal = 1'b0;
 #6 signal = 1'b0;
 end
 
 endmodule // pulse
 
 module Exemplo0046;
 wire clock;
 clock clk ( clock );
 reg p;
 wire p1;
 pulse p2( p1, clock );
 
 
 initial begin
 p = 1'b0;
 end
 
 initial begin
 $dumpfile("Exemplo0046.vcd");
 $monitor($time,,clock,,p1,,p);
 $dumpvars(1, clock, p1, p);
 
 #240 $finish;
 end
 
 endmodule // Exemplo0046