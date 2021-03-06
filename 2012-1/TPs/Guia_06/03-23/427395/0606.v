//ARQ1 - Guia06 - Eduardo Botelho de Andrade
`include "clock.v"

module pulse (signal,clock);
 input clock;
 output signal;
 reg signal;
 
 always @ (posedge clock)
  begin
   signal = 1'b1;
   #5 signal = 1'b0;
   #5 signal = 1'b1;
   #5 signal = 1'b0;
  end
endmodule

module testmodule;
 wire clock;
 clock clk (clock);
 
 wire p1;
 pulse pls (p1,clock);
 
 initial
  begin
   $dumpfile ("0606.vcd");
   $dumpvars;
   #230 $finish;
  end
endmodule
