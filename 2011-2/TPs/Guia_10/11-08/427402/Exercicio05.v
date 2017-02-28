// --------------------
// --- Memorio 8x8 bits  (usando flip-flops)
// --- Felipe Ferreira Andrade do Carmo
// --- Exercicio 05
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
  module mem1x8 (output [7:0] resp, input Adr, input RW, input [7:0] int, input clk);


  Mem M1 ( resp[0], Adr, RW, clk,  int[0]);
  Mem M2 ( resp[1], Adr, RW, clk,  int[1]);
  Mem M3 ( resp[2], Adr, RW, clk,  int[2]);
  Mem M4 ( resp[3], Adr, RW, clk,  int[3]);
  Mem M5 ( resp[4], Adr, RW, clk,  int[4]);
  Mem M6 ( resp[5], Adr, RW, clk,  int[5]);
  Mem M7 ( resp[6], Adr, RW, clk,  int[6]);
  Mem M8 ( resp[7], Adr, RW, clk,  int[7]);

  endmodule
  
//
// MEM 8x8
//
   
    module mem8x8 (output [0:7] resp , input [0:2] addr, input RW, input clk, input [0:7] int);
    
    wire out1, out2, out3, out4, out5, out6, out7, out8;
    wire [0:7] R1;
    wire [0:7] R2;
    wire [0:7] R3;
    wire [0:7] R4;
    wire [0:7] R5;
    wire [0:7] R6;
    wire [0:7] R7;
    wire [0:7] R8;

    DMX8 dmx1  (out1, out2, out3, out4,out5, out6, out7, out8, addr);

    mem1x8 M1  (R1, out1, RW, int, clk);
    mem1x8 M2  (R2, out2, RW, int, clk);
    mem1x8 M3  (R3, out3, RW, int, clk);
    mem1x8 M4  (R4, out4, RW, int, clk);
    mem1x8 M5  (R5, out5, RW, int, clk);
    mem1x8 M6  (R6, out6, RW, int, clk);
    mem1x8 M7  (R7, out7, RW, int, clk);
    mem1x8 M8  (R8, out8, RW, int, clk);
    
    MUX8 mux1  ( resp, R1, R2, R3, R4, R5, R6, R7, R8 );


    endmodule







