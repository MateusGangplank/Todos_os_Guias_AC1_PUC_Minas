// ---------------
// Exemplo0066 - Circuitos sequênciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// pulse: 30/09/2012
// ----------------

`include "flip_flop_jk_ass.v"

// ----------------
// Contador Decádico Assíncrono Crescente
// ----------------
module cont_deca_ass_cre(output [5:0]saida, input pulse, input jk, input clear);

wire qnotJK1, qnotJK2, qnotJK3, qnotJK4, qnotJK5, qnotJK6, // Saídas dos flip flops em Q'
     s0_n, s2_n, s4_n, s5_n, // Saídas das portas not
     d0, d1; // Saídas das duas portas nand

reg preset = 0;

// Determina o clear
not not1(s0_n, saida[0]);
not not2(s2_n, saida[2]);
not not3(s4_n, saida[4]);
not not4(s5_n, saida[5]);
nand nand1(d0, s0_n, saida[1], s2_n, saida[3], s4_n, s5_n);
nand nand2(d1, clear, d0);

// Chamada dos flip - flops
flip_flop_jk_ass ffjk1(saida[0], qnotJK1, jk, jk, pulse, d1, preset);
flip_flop_jk_ass ffjk2(saida[1], qnotJK2, jk, jk, qnotJK1, d1, preset);
flip_flop_jk_ass ffjk3(saida[2], qnotJK3, jk, jk, qnotJK2, d1, preset);
flip_flop_jk_ass ffjk4(saida[3], qnotJK4, jk, jk, qnotJK3, d1, preset);
flip_flop_jk_ass ffjk5(saida[4], qnotJK5, jk, jk, qnotJK4, d1, preset);
flip_flop_jk_ass ffjk6(saida[5], qnotJK6, jk, jk, qnotJK5, d1, preset);

endmodule //cont_ass_cre

// ----------------
// Exemplo0066
// ----------------
module exemplo0066;

// ---------------- Definir dados
 reg pulse, jk, clear;
 wire [5:0]saida;
 
// ---------------- Instância

cont_deca_ass_cre cac1(saida, pulse, jk, clear);


 // ---------------- Preparação
 initial begin: start
  pulse = 1'b0;
  jk = 1'b0;
  clear = 1'b1;
 end

// ----------------- Parte principal
 initial begin: main
  $display("Exemplo0066 - Josemar Alves Caetano - 448662.");
  $display("Teste Contador Decádico Assíncrono Crescente.\n");

  $monitor("Saida: %b",saida);

   #1 clear = 1; pulse = 1; jk = 1;
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

endmodule //exemplo0066


