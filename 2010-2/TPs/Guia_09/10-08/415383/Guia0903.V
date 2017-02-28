// ---------------------------
// Guia 09
// ---------------------------

`include "clock.v"

module pulse1 ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

 always @ ( posedge clock )
  begin
      signal = 1'b1;
  #4  signal = 1'b0;
  #4  signal = 1'b1;
  #4  signal = 1'b0;
  end
endmodule // pulse

module pulse2 ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

 always @ ( negedge clock )
  begin
      signal = 1'b1;
  #4  signal = 1'b0;
  #4  signal = 1'b1;
  #4  signal = 1'b0;
  end
endmodule // pulse


module Guia0903;

 wire  clock;
 clock clk ( clock );
 wire  p1;
 wire  p2;

 pulse1   pls1   ( p1, clock );
 pulse2   pls2   ( p2, clock );

 initial begin
  $dumpfile ( "Guia0903.vcd" );
  $dumpvars ( 1, clock, p1, p2);

  #480 $finish;
 end

endmodule
