// ---------------------------
// -- test clock generator (1)
// ---------------------------

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

endmodule // clock ( )

module testclock01a;

 wire  clk;
 clock CLK1 ( clk );

 initial begin
  $dumpfile ( "testclock01a.vcd" );
  $dumpvars;

  #120 $finish;
 end

endmodule // testclock1a ( )