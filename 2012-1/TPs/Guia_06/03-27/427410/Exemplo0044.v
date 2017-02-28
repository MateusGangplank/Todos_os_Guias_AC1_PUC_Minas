// -------------------------
//  Exemplo0044
// Nome: Gustavo Barbosa
// Matricula: 427410

`include "clock.v"

module pulse (signal,clock);
 input clock;
 output signal;
 reg signal;

 always @ (posedge clock)
  begin
   signal = 1'b1;
   #36 signal = 1'b0;
   #36 signal = 1'b1;
   #36 signal = 1'b0;
   #36 signal = 1'b1;
   #36 signal = 1'b0;
   #36 signal = 1'b1;
   #36 signal = 1'b1;
  end
endmodule

module testmodule;
 wire clock;
 clock clk (clock);
 
 wire p1;
 pulse pls (p1,clock);
 
 initial begin
   $display("Exemplo0044 - Gustavo Barbosa - 427410");
   $dumpfile ("Exemplo0044.vcd");
   $dumpvars;
   #288 $finish;
  end
endmodule
