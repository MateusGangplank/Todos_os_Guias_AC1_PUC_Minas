// ---------------
// Exemplo0068 - Circuitos sequênciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// pulse: 30/09/2012
// ----------------

`include "flip_flop_t_ass.v"


// ----------------
// Contador Módulo 10
// ----------------
module cont_mod_10(output [3:0]saida, input pulse, input clear);

wire qnotT1, qnotT2, qnotT3, qnotT4, // Saídas dos flip flops em Q'
     qnotT2_n, qnotT4_n, // Saídas das portas not
     d0, d1; // Saídas das portas lógicas
     
reg preset = 0;

// Determina o clear
not not1(qnotT2_n, qnotT2);
not not2(qnotT4_n, qnotT4);
and and1(d0, qnotT1, qnotT2_n, qnotT3, qnotT4_n);
or or1(d1, clear, d0);

// Chamada dos flip - flops
flip_flop_t_ass fft4(saida[0], qnotT4, pulse, pulse, d1, preset);
flip_flop_t_ass fft3(saida[1], qnotT3, qnotT4, qnotT4, d1, preset);
flip_flop_t_ass fft2(saida[2], qnotT2, qnotT3, qnotT3, d1, preset);
flip_flop_t_ass fft1(saida[3], qnotT1, qnotT2, qnotT2, d1, preset);

endmodule //cont_mod_10

// ----------------
// Exemplo0068
// ----------------
module exemplo0068;

// ---------------- Definir dados
 reg pulse, clear;
 wire [3:0]saida;
 
// ---------------- Instância

cont_mod_10 cm10(saida, pulse, clear);


 // ---------------- Preparação
 initial begin: start
  pulse = 1'b1;
  clear = 1'b1;
 end

// ----------------- Parte principal
 initial begin: main
  $display("Exemplo0068 - Josemar Alves Caetano - 448662.");
  $display("Teste Contador Módulo 10.\n");

  $monitor("Saida: %b",saida);

   #1 pulse = 1; clear = 0;
   #1 pulse = 1;
   #1 pulse = 0;
   #1 pulse = 0;
   #1 pulse = 1;
   #1 pulse = 0;
   #1 pulse = 1;
   #1 pulse = 0;



 
end

endmodule //exemplo0068


