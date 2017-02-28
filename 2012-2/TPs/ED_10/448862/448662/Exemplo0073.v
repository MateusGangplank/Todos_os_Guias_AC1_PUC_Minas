// ---------------
// Exemplo0073 - Circuitos sequênciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// pulse: 08/10/2012
// ----------------

`include "Exemplo0071.v"

// ----------------
// Memória RAM 1x8
// ----------------
module memoria1x8(output [7:0]out, input clk, input addr, input rw, input in, input preset, input clr);

// Chamada das memórias 1x4

memoria1x4 m1(out[7:4], clk, addr, rw, in, preset, clr);
memoria1x4 m2(out[3:0], clk, addr, rw, in, preset, clr);

endmodule //memoria1x8

// ----------------
// Exemplo0073
// ----------------
module exemplo0073;

// ---------------- Definição de dados
wire [7:0]out;
reg clk, addr, rw, in, preset, clr;

// ---------------- Instância
 memoria1x8 memo1_8(out, clk, addr, rw, in, preset, clr);

// ---------------- Preparação
 initial begin: start
  clk = 1;
  addr = 0;
  rw = 0;
  in = 0;
  preset = 1;
  clr = 0;
 end
 
// ---------------- Parte principal
 initial begin: main
  $display("Exemplo0073 - Josemar Alves Caetano - 448662.");
  $display("Teste Memória RAM 1x8.\n");

  $monitor("Saída: %b",out);

   #1 clr = 1;
   #1 clr = 0;
   #1 clk = 1; addr = 1; rw = 1; in = 1;
   #1 clk = 1; addr = 1; rw = 1; in = 1;
   #1 addr = 0;
   #1 addr = 1;

end

endmodule //exemplo0073



