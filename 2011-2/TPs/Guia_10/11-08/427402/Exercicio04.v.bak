// --------------------
// --- Memorio 1x8 bits  (usando flip-flops)
// --- Felipe Ferreira Andrade do Carmo
// --- Exercicio 02
// --------------------

`include "Flipflops.v"
`include "clock.v"
`include "DMX.v"

//
//MEM 1x1
//
  module Mem(output s, input addr, input rw, input clk, input int );
  wire clk2, s2, qnot;

  and  AND1 ( clk2, addr, rw, clk);
  jkff JK1  ( s2, qnot, int, ~int, clk2);
  and  AND2 ( s, s2, addr);

  endmodule
//
// MEM 1x8
//
  module mem1x4 (output [7:0] resp, input Adr, input RW, input [7:0] int, input clk);


  Mem M1 ( resp[0], Adr, RW, clk,  int[0]);
  Mem M2 ( resp[1], Adr, RW, clk,  int[1]);
  Mem M3 ( resp[2], Adr, RW, clk,  int[2]);
  Mem M4 ( resp[3], Adr, RW, clk,  int[3]);
  Mem M5 ( resp[4], Adr, RW, clk,  int[4]);
  Mem M6 ( resp[5], Adr, RW, clk,  int[5]);
  Mem M7 ( resp[6], Adr, RW, clk,  int[6]);
  Mem M8 ( resp[7], Adr, RW, clk,  int[7]);

  endmodule







