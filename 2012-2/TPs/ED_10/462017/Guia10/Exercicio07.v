// Breno Macena Pereira de Souza
// 462017

`include "ram4x8.v"

module exercicio04;
   wire [7:0] out;
   reg  [7:0] in;
   reg  [1:0] addr;
   reg clk, rw, clear;

   RAM4x8 R (out, in, clk, rw, addr, clear);

   initial
   begin
   $display (" in              clock  addr  rw  out");
      in = 8'b01101100;   clk = 0;   rw = 1;   addr = 2'b00;   clear = 0;
      $monitor ("%b    %b      %b      %b    %b",in, clk, addr, rw, out);
   #1 in = 8'b01101100;   clk = 0;   addr = 2'b00;   rw = 1;
   #1 in = 8'b01101100;   clk = 1;   addr = 2'b00;   rw = 1;
   #1 in = 8'b00001111;   clk = 0;   addr = 2'b01;   rw = 1;
   #1 in = 8'b00001111;   clk = 1;   addr = 2'b01;   rw = 1;
   #1 in = 8'b11110000;   clk = 0;   addr = 2'b10;   rw = 1;
   #1 in = 8'b11110000;   clk = 1;   addr = 2'b10;   rw = 1;
   #1 in = 8'b10101010;   clk = 0;   addr = 2'b11;   rw = 1;
   #1 in = 8'b10101010;   clk = 1;   addr = 2'b11;   rw = 1;
   #1 $display ();
   #1 in = 8'b00000000;   clk = 1;   addr = 2'b00;
   #1 in = 8'b00000000;   clk = 0;   addr = 2'b01;
   #1 in = 8'b00000000;   clk = 1;   addr = 2'b10;
   #1 in = 8'b00000000;   clk = 1;   addr = 2'b11;
   end
endmodule
