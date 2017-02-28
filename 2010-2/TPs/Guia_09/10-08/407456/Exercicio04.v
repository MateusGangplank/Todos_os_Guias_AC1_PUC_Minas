//`include "clock.v"

module clock ( clk );
 output clk;
 reg    clk;

 initial
  begin
   clk = 1'b0;
  end

 always
  begin
   #6 clk = ~clk;
  end
endmodule //endClock

module pulse ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

 always @ ( clock )
  begin
        signal = 1'b0;
  #60   signal = 1'b1;
  #60   signal = 1'b0;
   end
endmodule //endPulse

module Exercicio04;

 wire  clock;
 clock clk ( clock );

 reg   p;

 wire  r;

 pulse   pulse1   ( r, clock );
 
 initial begin
   p = 1'b0;
 end

 initial begin
  $dumpfile ( "Exercicio04.vcd" );
  $dumpvars ( 1, clock, r);

  #060 p = 1'b1;
  #120 p = 1'b0;
  #180 p = 1'b1;
  #240 p = 1'b0;
  #300 p = 1'b1;
  #360 p = 1'b0;
  #376 $finish;
 end

endmodule //Exercicio04