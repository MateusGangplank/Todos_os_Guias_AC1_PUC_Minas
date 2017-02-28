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

 always @ ( posedge clock )
  begin
      signal = 1'b1;
  #4  signal = 1'b0;
  #4  signal = 1'b1;
  #4  signal = 1'b0;
  end
endmodule // pulse

module pulse2 ( signal, clock2 );
 input  clock2;
 output signal;
 reg    signal;

 always @ ( negedge clock2 )
  begin
      signal = 1'b1;
  #4  signal = 1'b0;
  #4  signal = 1'b1;
  #4  signal = 1'b0;  

  end
endmodule // pulse


module testclock01b;

 wire  clock;
 clock clk ( clock );


 wire  p1,t1,p2,t2;

 pulse   pulse1   ( p1, clock );
 pulse2   pulse2   ( p2, clock );



 initial begin
  $dumpfile ( "Exercicio05.vcd" );
  $dumpvars ( 1, clock, p1);

  #376 $finish;
 end

endmodule // testclock01b
