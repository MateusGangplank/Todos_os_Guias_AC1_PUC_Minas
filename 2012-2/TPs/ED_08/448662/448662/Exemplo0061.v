// ---------------
// Exemplo0061 - Circuitos sequênciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 27/09/2012
// ----------------

`include "flip_flop_d.v"

// ----------------
// Conversor Paralelo - Série
// ----------------
module conv_paral_ser(output [4:0]saida, input clk, input ld, input[4:0]d, input reset);

wire s1, s2, s3, s4, s5;
reg const = 1'b0; //Constante zero

//Chamada dos flip-flops
flip_flop_d fpd5(saida[0], saida[1], clk, reset);
flip_flop_d fpd4(saida[1], saida[2], clk, reset);
flip_flop_d fpd3(saida[2], saida[3], clk, reset);
flip_flop_d fpd2(saida[3], saida[4], clk, reset);
flip_flop_d fpd1(saida[4], const, clk, reset);

endmodule //conv_paral_ser

// ----------------
// Exemplo0061
// ----------------
module Exemplo0061;

//----------------- Definir dados
reg ld, reset, clk;
wire [4:0]saida;
reg [4:0]d;

// ---------------- Instância
 conv_paral_ser cps1(saida, clk, ld, d, reset);

// ---------------- Preparação
 initial begin: start
  ld = 1'b1;
  reset = 1'b0;
  clk = 1'b1;
  d = 5'b11111;
 end

// ----------------- Parte principal
 initial begin: main
  $display("Exemplo0061 - Josemar Alves Caetano - 448662.");
  $display("Teste Conversor paralelo série.");

  $monitor("Saida: %b", saida);

 #1 ld = 1'b0; clk = 1'b0;
 #1 clk = 1'b1;
 #1 clk = 1'b0;
 #1 clk = 1'b1;
 #1 clk = 1'b0;
 #1 clk = 1'b1;
 #1 clk = 1'b0;
 #1 clk = 1'b1;

end

endmodule //Exemplo0061


