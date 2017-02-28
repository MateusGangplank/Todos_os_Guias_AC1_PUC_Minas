// --------------------
// --- Memorio 4x8 bits
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
// MEM 1x4
//
  module mem1x4 (output [3:0] resp, input Adr, input RW, input [3:0] int, input clk);


  Mem M1 ( resp[0], Adr, RW, clk,  int[0]);
  Mem M2 ( resp[1], Adr, RW, clk,  int[1]);
  Mem M3 ( resp[2], Adr, RW, clk,  int[2]);
  Mem M4 ( resp[3], Adr, RW, clk,  int[3]);

  endmodule
//
// MEM 1x8
//
   module mem1x8 (output [7:0] Resp, input Addr, input RW, input Clk, input[7:0] int);

   mem1x4  M1 ( Resp [3:0],Addr, RW,int [3:0], Clk);
   mem1x4  M2 ( Resp [7:4],Addr, RW,int [7:4], Clk);

   endmodule
   
//
// MEM 4x8
//
   
    module mem4x8 (output [0:7] resp , input [0:1] addr, input RW, input clk, input [0:7] int);
    
    wire out1, out2, out3, out4;
    wire [0:7] R1;
    wire [0:7] R2;
    wire [0:7] R3;
    wire [0:7] R4;

    DMX dmx1  (out1, out2, out3, out4, addr);

    mem1x8 M1  (R1, out1, RW, clk, int);
    mem1x8 M2  (R2, out2, RW, clk, int);
    mem1x8 M3  (R3, out3, RW, clk, int);
    mem1x8 M4  (R4, out4, RW, clk, int);
    
    MUX mux1  ( resp, R1, R2, R3, R4);


    endmodule






