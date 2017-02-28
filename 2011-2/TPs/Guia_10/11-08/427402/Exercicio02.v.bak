// --------------------
// --- Memorio 4 bits
// --- Felipe Ferreira Andrade do Carmo
// --- Exercicio 02
// --------------------

`include "Flipflops.v"
`include "clock.v"

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
// TESTE
//

  module Teste_Exercicio02;

  reg [7:0] a;
  reg addr;
  reg rw;
  reg clk;
  wire [7:0] resp;

  mem1x8 M1 (resp, addr, rw,clk, a);

initial begin
      $display("Memorio JK - Felipe Ferreira Andrade do Carmo- 427402");
      $display("Exercicio 02");
      #1
      addr = 1; rw = 1; a = 01111111; clk = 0;
      $display(" ");
      $display("Saida");
      #1
      $display ( "%8b -> %8b   ( R/W = %1b  clk = %1b) ",a, resp, rw , clk );
      clk = 1;
      #1
       $display ( "%8b -> %8b   ( R/W = %1b  clk = %1b) ",a, resp, rw , clk );
      addr = 1; rw = 0; a = 10111111; clk = 0;
      #1
       $display ( "%8b -> %8b   ( R/W = %1b  clk = %1b) ",a, resp, rw , clk );
       clk = 1;      rw = 1;   a = 10111111;
      #1
       $display ( "%8b -> %8b   ( R/W = %1b  clk = %1b) ",a, resp, rw , clk );
       clk = 0;
      #1
       $display ( "%8b -> %8b   ( R/W = %1b  clk = %1b) ",a, resp, rw , clk );

      end
endmodule




