// ---------------
// Exemplo0058 - Circuitos sequênciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 27/09/2012
// ----------------

`include "flip_flop_d.v"

// ----------------
// Registrador de deslocamento
// ----------------
module reg_desloc_esq2(output [4:0]saida, input data, input clk, input reset);

wire s1, s2, s3, s4, data_n;

not not1(data_n, data);

//Chamada dos flip-flops
flip_flop_d fpd5(saida[0], data, clk, reset);
and and4(s4, saida[0], data_n);
flip_flop_d fpd4(saida[1], s4, clk, reset);
and and3(s3, saida[1], data_n);
flip_flop_d fpd3(saida[2], s3, clk, reset);
and and2(s2, saida[2], data_n);
flip_flop_d fpd2(saida[3], s2, clk, reset);
and and1(s1, saida[3], data_n);
flip_flop_d fpd1(saida[4], s1, clk, reset);

endmodule //reg_desloc_esq2

// ----------------
// Exemplo0058
// ----------------
module Exemplo0058;

//----------------- Definir dados
reg data, reset, clk;
wire [4:0]saida;

// ---------------- Instância
 reg_desloc_esq2 rde1(saida, data, clk, reset);

// ---------------- Preparação
 initial begin: start
  data = 1'b1;
  reset = 1'b0;
  clk = 1'b1;
 end

// ----------------- Parte principal
 initial begin: main
  $display("Exemplo0058 - Josemar Alves Caetano - 448662.");
  $display("Teste Registrador de deslocamento para esquerda.");

  $monitor("Saida: %b", saida);

 #1 data = 1'b0; clk = 1'b0;
 #1 data = 1'b0; clk = 1'b1;
 #1 data = 1'b0; clk = 1'b0;
 #1 data = 1'b0; clk = 1'b1;
 #1 data = 1'b0; clk = 1'b0;
 #1 data = 1'b0; clk = 1'b1;
 #1 data = 1'b0; clk = 1'b0;
 #1 data = 1'b0; clk = 1'b1;
 #1 data = 1'b0; reset = 1'b1;
 
end

endmodule //Exemplo0058


