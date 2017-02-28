// Breno Macena Pereira de Souza
// 462017

// -----------------
// -- teste RAM 2x4
// -----------------

`include "ram2x4.v"

module exercicio02;
   wire [3:0] out;
   reg  [3:0] in;
   reg clk, rw, addr, clear;

   RAM2x4 R (out, in, clk, rw, addr, clear);

   initial
   begin
   $display (" in     clock  addr  rw  out");
      in = 4'b1010;   clk = 0;   rw = 1;   addr = 1;   clear = 0;
      $monitor ("%b    %b      %b      %b    %b",in, clk, addr, rw, out);
   #1 in = 4'b1010;   clk = 1;   rw = 1;   addr = 1;
   #1 in = 4'b1010;   clk = 0;   rw = 0;   addr = 1;
   #1 in = 4'b0110;   clk = 0;   rw = 1;   addr = 0;
   #1 in = 4'b0110;   clk = 1;   rw = 1;   addr = 0;
   #1 in = 4'b0110;   clk = 0;   rw = 0;   addr = 0;
   #1 in = 4'b0110;   clk = 0;   rw = 0;   addr = 0;
   #1 $display ();
   #1 in = 4'b0000;                        addr = 1;
   #1 in = 4'b0000;                        addr = 0;
   end
endmodule