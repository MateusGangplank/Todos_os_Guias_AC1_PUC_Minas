// ---------------
// Exemplo0065 - Circuitos sequênciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// pulse: 30/09/2012
// ----------------

`include "flip_flop_jk_ass.v"

// ----------------
// Contador Assíncrono Crescente
// ----------------
module cont_ass_cre(output [4:0]saida, input pulse, input jk, input clear);

wire q;
reg preset = 0;

// Chamada dos flip - flops
flip_flop_jk_ass ffjk5(q, saida[0], jk, jk, pulse, clear, preset);
flip_flop_jk_ass ffjk4(q, saida[1], jk, jk, saida[0], clear, preset);
flip_flop_jk_ass ffjk3(q, saida[2], jk, jk, saida[1], clear, preset);
flip_flop_jk_ass ffjk2(q, saida[3], jk, jk, saida[2], clear, preset);
flip_flop_jk_ass ffjk1(q, saida[4], jk, jk, saida[3], clear, preset);

endmodule //cont_ass_cre

// ----------------
// Exemplo0065
// ----------------
module exemplo0065;

// ---------------- Definir dados
 reg pulse, jk, clear;
 wire [4:0]saida;
 
// ---------------- Instância

cont_ass_cre cac1(saida, pulse, jk, clear);


 // ---------------- Preparação
 initial begin: start
  pulse = 1'b0;
  jk = 1'b0;
  clear = 1'b1;
 end

// ----------------- Parte principal
 initial begin: main
  $display("Exemplo0065 - Josemar Alves Caetano - 448662.");
  $display("Teste Contador assíncrono crescente.\n");

  $monitor("Saida: %b",saida);

   #1 clear = 0; jk = 1;
   #1 pulse = 1;
   #1 pulse = 0; 
   #1 pulse = 1;
   #1 pulse = 0;
   #1 pulse = 1;
   #1 pulse = 0; 
   #1 pulse = 1;
   #1 pulse = 0;
   #1 pulse = 1;
   #1 pulse = 0; 
   #1 pulse = 1;
   #1 pulse = 0;
   #1 pulse = 1;
   #1 pulse = 0; 
   #1 pulse = 1;
   #1 pulse = 0;
   #1 pulse = 1;
   #1 pulse = 0; 
   #1 pulse = 1;
   #1 pulse = 0;
   #1 pulse = 1;
   #1 pulse = 0; 
   #1 pulse = 1;
   #1 pulse = 0;
   #1 pulse = 1;
   #1 pulse = 0; 
   #1 pulse = 1;
   #1 pulse = 0;
   #1 pulse = 1;
   #1 pulse = 0; 
   #1 pulse = 1;
   #1 pulse = 0;
   #1 pulse = 1;
   #1 pulse = 0;
   #1 pulse = 1;
   #1 pulse = 0; 
   #1 pulse = 1;
   #1 pulse = 0;
   #1 pulse = 1;
   #1 pulse = 0; 
   #1 pulse = 1;
   #1 pulse = 0;
   #1 pulse = 1;
   #1 pulse = 0; 
   #1 pulse = 1;
   #1 pulse = 0;
   #1 pulse = 1;
   #1 pulse = 0; 
   #1 pulse = 1;
   #1 pulse = 0;
   #1 pulse = 1;
   #1 pulse = 0; 
   #1 pulse = 1;
   #1 pulse = 0;
   #1 pulse = 1;
   #1 pulse = 0; 
   #1 pulse = 1;
   #1 pulse = 0;
   #1 pulse = 1;
   #1 pulse = 0; 
   #1 pulse = 1;
   #1 pulse = 0;
   #1 pulse = 1;
   #1 pulse = 0;



end

endmodule //exemplo0065


