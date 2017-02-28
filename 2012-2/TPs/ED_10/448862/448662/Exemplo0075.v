// ---------------
// Exemplo0075 - Circuitos sequênciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// pulse: 09/10/2012
// ----------------

`include "Exemplo0074.v"

// ----------------
// Memória RAM 8x8
// ----------------
module memoria8x8(output [7:0]out0, output [7:0]out1, input clk, input [3:0]addr, input rw, input in, input preset, input clr);

// Chamada das memórias 1x4

memoria2x8 m1(out0, clk, addr[3:2], rw, in, preset, clr);
memoria2x8 m2(out1, clk, addr[1:0], rw, in, preset, clr);

endmodule //memoria8x8

// ----------------
// Exemplo0075
// ----------------
module exemplo0075;

// ---------------- Definição de dados
wire [7:0]out0, out1;
reg [3:0]addr;
reg clk, rw, in, preset, clr;

// ---------------- Instância
 memoria8x8 memo8_8(out0, out1, clk, addr, rw, in, preset, clr);

// ---------------- Preparação
 initial begin: start
  clk = 1;
  addr = 4'b1111;
  rw = 0;
  in = 0;
  preset = 1;
  clr = 0;
 end
 
// ---------------- Parte principal
 initial begin: main
  $display("Exemplo0075 - Josemar Alves Caetano - 448662.");
  $display("Teste Memória RAM 8x8.\n");

  $monitor("Saídas: %b e %b",out0, out1);

   #1 clr = 1;
   #1 clr = 0;
   #1 clk = 1; addr = 4'b0011; rw = 1; in = 1;
   #1 clk = 1; addr = 4'b1100; rw = 1; in = 1;
   #1 addr = 4'b0001;
   #1 addr = 4'b0010;
   #1 addr = 4'b0011;
   #1 addr = 4'b0100;
   #1 addr = 4'b0101;
   #1 addr = 4'b0110;
   #1 addr = 4'b0111;
   #1 addr = 4'b1000;
   #1 addr = 4'b1111;


end

endmodule //exemplo0075



