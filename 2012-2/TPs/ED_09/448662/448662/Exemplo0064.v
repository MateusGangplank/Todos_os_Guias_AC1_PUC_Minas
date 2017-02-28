// ---------------
// Exemplo0064 - Circuitos sequênciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// pulse: 30/09/2012
// ----------------

`include "flip_flop_jk_ass.v"

// ----------------
// Contador Assíncrono decrescente
// ----------------
module cont_ass_dec(output [4:0]saida, input pulse, input jk, input clear, input preset);

wire qnot;

// Chamada dos flip - flops

flip_flop_jk_ass ffjk5(saida[0], qnot, jk, jk, pulse, clear, preset);
flip_flop_jk_ass ffjk4(saida[1], qnot, jk, jk, saida[0], clear, preset);
flip_flop_jk_ass ffjk3(saida[2], qnot, jk, jk, saida[1], clear, preset);
flip_flop_jk_ass ffjk2(saida[3], qnot, jk, jk, saida[2], clear, preset);
flip_flop_jk_ass ffjk1(saida[4], qnot, jk, jk, saida[3], clear, preset);


endmodule //cont_ass_dec

// ----------------
// Exemplo0064
// ----------------
module exemplo0064;

// ---------------- Definir dados
 reg pulse, jk, clear, preset;
 wire [4:0]saida;
 
// ---------------- Instância

cont_ass_dec cad1(saida, pulse, jk, clear, preset);


 // ---------------- Preparação
 initial begin: start
  pulse = 1'b0;
  jk = 1'b0;
  preset = 1'b1;
  clear = 1'b0;
 end

// ----------------- Parte principal
 initial begin: main
  $display("Exemplo0064 - Josemar Alves Caetano - 448662.");
  $display("Teste Contador assíncrono decrescente.\n");

  $monitor("Saida: %b",saida);

   #1 preset = 0;
   #1 pulse = 1'b1; jk = 1'b1;
   #1 pulse = 1'b0;
   #1 pulse = 1'b1;
   #1 pulse = 1'b0;
   #1 pulse = 1'b1;


end

endmodule //exemplo0064


