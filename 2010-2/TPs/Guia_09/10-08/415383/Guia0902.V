// ---------------------------
// Guia 09
// ---------------------------

`include "clock.v"

module pulse1 ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

 always @ ( clock )
  begin
      signal = 1'b1;
  #4  signal = 1'b0;
  #4  signal = 1'b1;
  #4  signal = 1'b0;
  #4  signal = 1'b1;
  #4  signal = 1'b0;
  end
endmodule // pulse

module Guia0902;

 wire  clock;
 clock clk ( clock );
 wire  p1;

 pulse1   pls1   ( p1, clock );

 initial begin
  $dumpfile ( "Guia0902.vcd" );
  $dumpvars ( 1, clock, p1 );

  #480 $finish;
 end

endmodule
