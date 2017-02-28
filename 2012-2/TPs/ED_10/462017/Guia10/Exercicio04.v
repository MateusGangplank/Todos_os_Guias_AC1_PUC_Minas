// Breno Macena Pereira de Souza
// 462017

`include "ram2x8.v"

module exercicio04;
   wire [7:0] out;
   reg  [7:0] in;
   reg clk, rw, addr, clear;

   RAM2x8 R (out, in, clk, rw, addr, clear);

   initial
   begin
   $display (" in              clock  addr  rw  out");
      in = 8'b01101100;   clk = 1;   rw = 0;   addr = 1;   clear = 0;
      $monitor ("%b    %b      %b      %b    %b",in, clk, addr, rw, out);
   #1 in = 8'b01101100;   clk = 0;   addr = 1;   rw = 0;
   #1 in = 8'b01101100;   clk = 1;   addr = 1;   rw = 1;
   #1 in = 8'b00000000;   clk = 0;   addr = 0;   rw = 0;
   #1 in = 8'b10101010;   clk = 1;   addr = 0;   rw = 1;
   #1 in = 8'b00000000;   clk = 0;   addr = 0;   rw = 0;
   #1 in = 8'b00000000;   clk = 1;   addr = 0;   rw = 0;
   #1 $display ();
   #1 in = 8'b00000000;   clk = 0;   addr = 1;   rw = 0;
   #1 in = 8'b00000000;   clk = 1;   addr = 0;   rw = 0;
   end
endmodule