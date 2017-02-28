// ---------------
// Exemplo0060 - Circuitos sequênciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 27/09/2012
// ----------------

`include "flip_flop_d.v"

// ----------------
// Registrador de deslocamento
// ----------------
module reg_desloc_esq2(output [4:0]saida, input data, input clk, input reset);

wire s0;

or or1(s0, saida[0], data);

//Chamada dos flip-flops
flip_flop_d fpd5(saida[4], s0, clk, reset);
flip_flop_d fpd4(saida[3], saida[4], clk, reset);
flip_flop_d fpd3(saida[2], saida[3], clk, reset);
flip_flop_d fpd2(saida[1], saida[2], clk, reset);
flip_flop_d fpd1(saida[0], saida[1], clk, reset);

endmodule //reg_desloc_esq2

// ----------------
// Exemplo0060
// ----------------
module Exemplo0060;

//----------------- Definir dados
reg data, reset, clk;
wire [4:0]saida;

// ---------------- Instância
 reg_desloc_esq2 rde2(saida, data, clk, reset);

// ---------------- Preparação
 initial begin: start
  data = 1'b1;
  reset = 1'b0;
  clk = 1'b1;
 end

// ----------------- Parte principal
 initial begin: main
  $display("Exemplo0060 - Josemar Alves Caetano - 448662.");
  $display("Teste Registrador de deslocamento para esquerda em anel torcido circular.");

  $monitor("Saida: %b", saida);

 #1 data = 1'b0; clk = 1'b0;
 #1 data = 1'b0; clk = 1'b1;
 #1 data = 1'b0; clk = 1'b0;
 #1 data = 1'b0; clk = 1'b1;
 #1 data = 1'b0; clk = 1'b0;
 #1 data = 1'b0; clk = 1'b1;
 #1 data = 1'b0; clk = 1'b0;
 #1 data = 1'b0; clk = 1'b1;
 #1 data = 1'b0;
 #1 data = 1'b0; clk = 1'b0;
 #1 data = 1'b0; clk = 1'b1;
 #1 data = 1'b0; clk = 1'b0;
 #1 data = 1'b0; clk = 1'b1;
 #1 data = 1'b0; clk = 1'b0;
 #1 data = 1'b0; clk = 1'b1;
 #1 data = 1'b0; clk = 1'b0;
 #1 data = 1'b0; clk = 1'b1;
 #1 data = 1'b0; clk = 1'b0;
 #1 data = 1'b0; clk = 1'b1;

end

endmodule //Exemplo0060


