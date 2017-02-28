// ---------------
// Exemplo0071 - Circuitos sequênciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// pulse: 08/10/2012
// ----------------

`include "memoria1x1.v"

// ----------------
// Memória RAM 1x4
// ----------------
module memoria1x4(output [3:0]out, input clk, input addr, input rw, input in, input preset, input clr);

// Chamada das memórias 1x1
memoria1x1 m1(out[3], clk, addr, rw, in, preset, clr);
memoria1x1 m2(out[2], clk, addr, rw, in, preset, clr);
memoria1x1 m3(out[1], clk, addr, rw, in, preset, clr);
memoria1x1 m4(out[0], clk, addr, rw, in, preset, clr);

endmodule //memoria1x4

// ----------------
// Exemplo0071
// ----------------
module exemplo0071;

// ---------------- Definição de dados
wire [3:0]out;
reg clk, addr, rw, in, preset, clr;

// ---------------- Instância
 memoria1x4 memo1_4(out, clk, addr, rw, in, preset, clr);
 
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
  $display("Exemplo0071 - Josemar Alves Caetano - 448662.");
  $display("Teste Memória RAM 1x4.\n");

  $monitor("Saida: %b",out);

   #1 clr = 1;
   #1 clr = 0;
   #1 clk = 1; addr = 1; rw = 1; in = 1;
   #1 clk = 1; addr = 1; rw = 1; in = 0;
   #1 addr = 0;
   #1 addr = 1;

end

endmodule //exemplo0071



