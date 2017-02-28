// ---------------
// Exemplo0076 - Circuitos sequênciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// pulse: 09/10/2012
// ----------------

`include "Exemplo0073.v"

// ----------------
// Memória RAM 4x8
// ----------------
module memoria4x8(output [31:0]out, input clk, input [3:0]addr, input rw, input in, input preset, input clr);

// Chamada das memórias 1x8

memoria1x8 m1(out[31:24], clk, addr[3], rw, in, preset, clr);
memoria1x8 m2(out[23:16], clk, addr[2], rw, in, preset, clr);
memoria1x8 m3(out[15:8], clk, addr[1], rw, in, preset, clr);
memoria1x8 m4(out[7:0], clk, addr[0], rw, in, preset, clr);

endmodule //memoria4x8

// ----------------
// Exemplo0077
// ----------------
module exemplo0077;

// ---------------- Definição de dados
wire [31:0]out;
reg [3:0]addr;
reg clk, rw, in, preset, clr;

// ---------------- Instância
 memoria4x8 memo4_8(out, clk, addr, rw, in, preset, clr);

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
  $display("Exemplo0077 - Josemar Alves Caetano - 448662.");
  $display("Teste Memória RAM 4x8.\n");

  $monitor("Saídas: %b",out);

   #1 clr = 1;
   #1 clr = 0;
   #1 clk = 1; addr = 4'b0001; rw = 1; in = 1;
   #1 clk = 1; addr = 4'b0010; rw = 1; in = 1;
   #1 clk = 1; addr = 4'b0100; rw = 1; in = 1;
   #1 clk = 1; addr = 4'b1000; rw = 1; in = 1;
   #1 addr = 4'b0000;
   #1 addr = 4'b1111;


end

endmodule //exemplo0077



