// ---------------------------
// -- test clock generator (2)
// ---------------------------

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
   #12 clk = ~clk;
  end
endmodule

module pulse ( signal, clock );
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

module trigger ( signal, on, clock );
 input  on, clock;
 output signal;
 reg    signal;

 always @ ( posedge clock & on )
  begin
  #60 signal = 1'b1;
  #60 signal = 1'b0;
  end
endmodule // trigger

module testclock01b;

 wire  clock;
 clock clk ( clock );

 reg   p;

 wire  p1,t1;

 pulse   pulse1   ( p1, clock );
 trigger trigger1 ( t1, p, clock );

 initial begin
   p = 1'b0;
 end

 initial begin
  $dumpfile ( "Exercicio01.vcd" );
  $dumpvars ( 1, clock, p1, p, t1 );

  #060 p = 1'b1;
  #120 p = 1'b0;
  #180 p = 1'b1;
  #240 p = 1'b0;
  #300 p = 1'b1;
  #360 p = 1'b0;
  #376 $finish;
 end

endmodule // testclock01b
