// Breno Macena Pereira de Souza
// 462017

// -----------------
// -- teste RAM 1x4
// -----------------

`include "ram1x4.v"

module exercicio01;
   wire [3:0] out;
   reg  [3:0] in;
   reg clk, rw, addr, clear;

   RAM1x4 R (out, in, clk, rw, addr, clear);

   initial
   begin
   $display (" in     clock  addr  rw  out");
      in = 4'b1010;   clk = 0;   rw = 0;   addr = 0;   clear = 0;
      $monitor ("%b    %b      %b      %b    %b",in, clk, addr, rw, out);
   #1 in = 4'b1010;   clk = 1;   rw = 1;   addr = 1;
   #1 in = 4'b0000;   clk = 0;   rw = 0;   addr = 1;
   #1 in = 4'b0000;   clk = 0;   rw = 0;   addr = 0;
   #1 in = 4'b0000;   clk = 0;   rw = 0;   addr = 1;
   end
endmodule