// ---------------
// Exemplo0063 - Circuitos sequênciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 27/09/2012
// ----------------

`include "flip_flop_d.v"

// ----------------
// Registrador de deslocamento
// ----------------
module reg_desloc_dir4(output [4:0]saida, input data, input clk, input reset);

wire s0, d1, d2, d3, d4, data_n;

or or1(s0, saida[0], data);
not not1(data_n, data);

//Declaração das portas
and and1(d1, saida[4], data_n);
and and2(d2, saida[3], data_n);
and and3(d3, saida[2], data_n);
and and4(d4, saida[1], data_n);

//Chamada dos flip-flops
flip_flop_d fpd1(saida[4], s0, clk, reset);
flip_flop_d fpd2(saida[3], d1, clk, reset);
flip_flop_d fpd3(saida[2], d2, clk, reset);
flip_flop_d fpd4(saida[1], d3, clk, reset);
flip_flop_d fpd5(saida[0], d4, clk, reset);

endmodule //reg_desloc_dir

// ----------------
// Exemplo0063
// ----------------
module Exemplo0063;

//----------------- Definir dados
reg data, reset, clk;
wire [4:0]saida;

// ---------------- Instância
 reg_desloc_dir4 rdd4(saida, data, clk, reset);

// ---------------- Preparação
 initial begin: start
  data = 1'b1;
  reset = 1'b0;
  clk = 1'b1;
 end

// ----------------- Parte principal
 initial begin: main
  $display("Exemplo0063 - Josemar Alves Caetano - 448662.");
  $display("Teste Registrador de deslocamento para direita em anel torcido circular.");

  $monitor("Saida: %b%b%b%b%b", saida[0], saida[1], saida[2], saida[3], saida[4],);

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

endmodule //Exemplo0063


