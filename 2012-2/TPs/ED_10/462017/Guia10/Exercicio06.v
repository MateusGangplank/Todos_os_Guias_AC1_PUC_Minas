// Breno Macena Pereira de Souza
// 462017

`include "ram1x16.v"

module exercicio04;
   wire [15:0] out;
   reg  [15:0] in;
   reg clk, rw, addr, clear;

   RAM1x16 R (out, in, clk, rw, addr, clear);

   initial
   begin
   $display (" in              clock  addr  rw  out");
      in = 16'b1010101010101010;   clk = 1;   rw = 0;   addr = 1;   clear = 0;
      $monitor ("%b    %b      %b      %b    %b",in, clk, addr, rw, out);
   #1 in = 16'b1010101010101010;   clk = 0;   addr = 1;   rw = 0;
   #1 in = 16'b1010101010101010;   clk = 1;   addr = 1;   rw = 1;
   #1 $display ();
   #1 in = 16'b0000000000000000;   clk = 0;   addr = 1;   rw = 0;
   #1 in = 16'b0000000000000000;   clk = 1;   addr = 0;   rw = 0;
   end
endmodule
