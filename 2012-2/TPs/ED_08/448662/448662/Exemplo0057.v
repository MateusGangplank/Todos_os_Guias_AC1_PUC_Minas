// ---------------
// Exemplo0057 - Circuitos sequ�nciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// Data: 27/09/2012
// ----------------

`include "flip_flop_d.v"

// ----------------
// Registrador de deslocamento
// ----------------
module reg_desloc_esq(output [4:0]saida, input data, input clk, input reset);

//Chamada dos flip-flops
flip_flop_d fpd5(saida[0], data, clk, reset);
flip_flop_d fpd4(saida[1], saida[0], clk, reset);
flip_flop_d fpd3(saida[2], saida[1], clk, reset);
flip_flop_d fpd2(saida[3], saida[2], clk, reset);
flip_flop_d fpd1(saida[4], saida[3], clk, reset);

endmodule //reg_desloc_esq

// ----------------
// Exemplo0057
// ----------------
module Exemplo0057;

//----------------- Definir dados
reg data, reset, clk;
wire [4:0]saida;

// ---------------- Inst�ncia
 reg_desloc_esq rde1(saida, data, clk, reset);

// ---------------- Prepara��o
 initial begin: start
  data = 1'b1;
  reset = 1'b0;
  clk = 1'b1;
 end

// ----------------- Parte principal
 initial begin: main
  $display("Exemplo0057 - Josemar Alves Caetano - 448662.");
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

endmodule //Exemplo0057


