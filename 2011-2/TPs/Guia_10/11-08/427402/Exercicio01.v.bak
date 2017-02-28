// --------------------
// --- Memorio 4 bits
// --- Felipe Ferreira Andrade do Carmo
// --- Exercicio 01
// --------------------

`include "Flipflops.v"
`include "clock.v"

module Mem(output s, input addr, input rw, input clk, input int );
wire clk2, s2, qnot;

and  AND1 ( clk2, addr, rw, clk);
jkff JK1  ( s2, qnot, int, ~int, clk2);
and  AND2 ( s, s2, addr);

endmodule

module mem1x4 (output [3:0] resp, input Adr, input RW, input [3:0] int, input clk);


Mem M1 ( resp[0], Adr, RW, clk,  int[0]);
Mem M2 ( resp[1], Adr, RW, clk,  int[1]);
Mem M3 ( resp[2], Adr, RW, clk,  int[2]);
Mem M4 ( resp[3], Adr, RW, clk, ~int[3]);

endmodule


module Teste_Exercicio01;

reg [3:0] a;
reg addr;
reg rw;
reg clk;
wire [3:0] resp;

mem1x4 M1 (resp, addr, rw, a, clk);

initial begin
      $display("Memorio JK - Felipe Ferreira Andrade do Carmo- 427402");
      $display("Exercicio 01");
      #1
      addr = 1; rw = 1; a = 0111; clk = 0;
      $display(" ");
      $display("Saida");
       #1
      $display ( "%4b",resp );
      clk = 1;
      #1
      $display ( "%4b",resp );
      addr = 1; rw = 1; a = 1011; clk = 0;
      #1
      $display ( "%4b",resp );
      clk = 1;
      #1
      $display ( "%4b",resp );
      clk = 0;
      #1
      $display ( "%4b",resp );

      end
 endmodule
