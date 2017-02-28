// ---------------
// Exemplo0074 - Circuitos sequênciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// pulse: 08/10/2012
// ----------------

`include "Exemplo0071.v"

// ----------------
// Memória RAM 2x4
// ----------------
module memoria2x4(output [3:0]out, input clk, input addr, input rw, input in, input preset, input clr);

// Chamada das memórias 1x4
memoria1x4 m1(out, clk, addr, rw, in, preset, clr);

endmodule //memoria2x4


// ----------------
// Memória RAM 2x8
// ----------------
module memoria2x8(output [7:0]out, input clk, input [1:0]addr, input rw, input in, input preset, input clr);

// Chamada das memórias 1x4

memoria2x4 m1(out[7:4], clk, addr[1], rw, in, preset, clr);
memoria2x4 m2(out[3:0], clk, addr[0], rw, in, preset, clr);

endmodule //memoria2x8

// ----------------
// Exemplo0074
// ----------------
module exemplo0074;

// ---------------- Definição de dados
wire [7:0]out;
reg [1:0]addr;
reg clk, rw, in, preset, clr;

// ---------------- Instância
 memoria2x8 memo2_8(out, clk, addr, rw, in, preset, clr);

// ---------------- Preparação
 initial begin: start
  clk = 1;
  addr = 2'b11;
  rw = 0;
  in = 0;
  preset = 1;
  clr = 0;
 end
 
// ---------------- Parte principal
 initial begin: main
  $display("Exemplo0074 - Josemar Alves Caetano - 448662.");
  $display("Teste Memória RAM 2x8.\n");

  $monitor("Saída: %b",out);

   #1 clr = 1;
   #1 clr = 0;
   #1 clk = 1; addr = 1; rw = 1; in = 1;
   #1 clk = 1; addr = 1; rw = 1; in = 1;
   #1 addr = 2'b01;
   #1 addr = 2'b10;
   #1 addr = 2'b11;

end

endmodule //exemplo0074



