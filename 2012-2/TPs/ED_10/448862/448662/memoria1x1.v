// ---------------
// Memória RAM 1X1 - Usando Flip - Flop JK
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// pulse: 08/10/2012
// ----------------

`include "flip_flop_jk.v"

// ----------------
// Memória RAM 1X1
// ----------------
module memoria1x1(output out, input clock, input addr, input rw, input in, input preset, input clr);

// Declaração dos fios do circuito
wire s0, s1, q, qnot;

// Chamada das portas
and and1(s0, clock, addr, rw);
or or1(s1, rw, in);

flip_flop_jk ffjk1(q, qnot, s1, s1, s0, preset, clr);

and and2(out, addr, q);

endmodule //memoria1x1