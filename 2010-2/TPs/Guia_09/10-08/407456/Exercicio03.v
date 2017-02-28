/*
O pulso sofre variação a cada
4 unidades de tempo 
ou quando o clock
varia.
*/
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
   #5 clk = ~clk;
  end
endmodule //endClock

module pulse ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

 always @ ( clock )
  begin
      signal = 1'b0;
  #4  signal = 1'b1;
    end
endmodule //endPulse

module Exercicio03;

 wire  clock;
 clock clk ( clock );

 reg   p;

 wire  r;

 pulse   pulse1   ( r, clock );
 
 initial begin
   p = 1'b0;
 end

 initial begin
  $dumpfile ( "Exercicio03.vcd" );
  $dumpvars ( 1, clock, r);

  #040 p = 1'b1;
  #080 p = 1'b0;
  #120 p = 1'b1;
  #160 p = 1'b0;
  #200 p = 1'b1;
  #240 p = 1'b0;
  #280 $finish;
 end

endmodule //Exercicio03

