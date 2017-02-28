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
  #24  signal = 1'b0;
  #24  signal = 1'b1;
  end
endmodule // pulse

module Guia0901;

 wire  clock;
 clock clk ( clock );
 wire  p1;

 pulse1   pls1   ( p1, clock );

 initial begin
  $dumpfile ( "Guia0901.vcd" );
  $dumpvars ( 1, clock, p1 );

  #480 $finish;
 end

endmodule
