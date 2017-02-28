// ---------------
// Exemplo0067 - Circuitos sequênciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// pulse: 30/09/2012
// ----------------

`include "flip_flop_jk_ass.v"

/* OBS.: PROFESSOR, COMO O ENUNCIADO DESTA QUESTÃO ESTAVA REPETIDO
         EU INTERPRETEI COMO UM CONTADOR DECÁDICO DECRESCENTE.
*/

// ----------------
// Contador Decádico Assíncrono Decrescente
// ----------------
module cont_deca_ass_dec(output [5:0]saida, input pulse, input jk);

wire qnotJK1, qnotJK2, qnotJK3, qnotJK4, qnotJK5, qnotJK6, // Saídas dos flip flops em Q'
     qnotJK1_n, qnotJK2_n, qnotJK4_n, qnotJK5_n, jk_n, // Saídas das portas not
     d0, d1; // Saídas das duas portas nand

reg clear = 0;
     
// Determina o preset
not not1(qnotJK1_n, qnotJK1);
not not2(qnotJK3_n, qnotJK3);
not not4(qnotJK5_n, qnotJK5);
not not3(qnotJK6_n, qnotJK6);
and and1(d0, qnotJK1_n, qnotJK2, qnotJK3_n, qnotJK4, qnotJK5_n, qnotJK6_n);
not not5(jk_n, jk);
or or1(d1, jk_n, d0);

// Chamada dos flip - flops
flip_flop_jk_ass ffjk1(saida[0], qnotJK1, jk, jk, pulse, clear, d1);
flip_flop_jk_ass ffjk2(saida[1], qnotJK2, jk, jk, qnotJK1, clear, d1);
flip_flop_jk_ass ffjk3(saida[2], qnotJK3, jk, jk, qnotJK2, clear, d1);
flip_flop_jk_ass ffjk4(saida[3], qnotJK4, jk, jk, qnotJK3, clear, d1);
flip_flop_jk_ass ffjk5(saida[4], qnotJK5, jk, jk, qnotJK4, clear, d1);
flip_flop_jk_ass ffjk6(saida[5], qnotJK6, jk, jk, qnotJK5, clear, d1);

endmodule //cont_deca_ass_dec

// ----------------
// Exemplo0067
// ----------------
module exemplo0067;

// ---------------- Definir dados
 reg pulse, jk;
 wire [5:0]saida;
 
// ---------------- Instância

cont_deca_ass_dec cad1(saida, pulse, jk);


 // ---------------- Preparação
 initial begin: start
  pulse = 1'b0;
  jk = 1'b0;
 end

// ----------------- Parte principal
 initial begin: main
  $display("Exemplo0067 - Josemar Alves Caetano - 448662.");
  $display("Teste Contador Decádico Assíncrono Decrescente.\n");

  $monitor("Saida: %b",saida);

   #1 pulse = 1; jk = 1;
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

endmodule //exemplo0067


