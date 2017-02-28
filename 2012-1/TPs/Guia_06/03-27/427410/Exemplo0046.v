// -------------------------
//  Exemplo0046
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
 
 initial begin
   $display("Exemplo0046 - Gustavo Barbosa - 427410");
   $dumpfile ("Exemplo0046.vcd");
   $dumpvars;
   #230 $finish;
  end
endmodule
