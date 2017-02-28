// --------------------
// --- Mealy-Moore FSM
// --------------------
//

`include "guia10-01.v"
`include "guia10-02.v"
`include "guia10-03.v"
`include "guia10-04.v"
`include "guia10-05.v"


module seq010_test;
 reg   clk, reset, x;
 wire  m1, m2, m3, m4, m5;

 seq010_mealy mealy1 ( m1, x, clk, reset );
 seq0110_moore moore1 ( m2, x, clk, reset );
 seq1010_mealy mealy2 ( m3, x, clk, reset );
 final moore2 ( m4, x, clk, reset );
 final1 moore3 ( m5, x, clk, reset );



 initial
  begin
   $display ( " Time    X   guia10-01   guia10-02   guia10-03   guia10-04   guia10-05" );

// initial values
       clk   = 1;
       reset = 0;
       x     = 0;

// input signal changing
  #5   reset = 1;
  #10  x = 1;
  #10  x = 0;
  #10  x = 1;
  #20  x = 0;
  #10  x = 1;
  #10  x = 1;
  #10  x = 0;
  #10  x = 1;
  #10  x = 0;
  #10  x = 0;
  #10  x = 0;
  #10  x = 1;
 
  #30 $finish;
 end // initial

 always
  #5 clk = ~clk;

 always @( posedge clk )
  begin
   $display ( "%4d  %4b   %4b       %5b       %5b       %4b       %4b", $time, x, m1, m2, m3, m5, m4);
  end // always at positive edge clocking changing

endmodule // 
