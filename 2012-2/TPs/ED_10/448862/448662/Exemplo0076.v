// ---------------
// Exemplo0076 - Circuitos sequ�nciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// pulse: 09/10/2012
// ----------------

`include "Exemplo0073.v"

// ----------------
// Mem�ria RAM 1x16
// ----------------
module memoria1x16(output [15:0]out, input clk, input addr, input rw, input in, input preset, input clr);

// Chamada das mem�rias 1x8

memoria1x8 m1(out[15:8], clk, addr, rw, in, preset, clr);
memoria1x8 m2(out[7:0], clk, addr, rw, in, preset, clr);

endmodule //memoria1x16

// ----------------
// Exemplo0076
// ----------------
module exemplo0076;

// ---------------- Defini��o de dados
wire [15:0]out;
reg addr;
reg clk, rw, in, preset, clr;

// ---------------- Inst�ncia
 memoria1x16 memo1_16(out, clk, addr, rw, in, preset, clr);

// ---------------- Prepara��o
 initial begin: start
  clk = 1;
  addr = 1;
  rw = 0;
  in = 0;
  preset = 1;
  clr = 0;
 end
 
// ---------------- Parte principal
 initial begin: main
  $display("Exemplo0076 - Josemar Alves Caetano - 448662.");
  $display("Teste Mem�ria RAM 1x16.\n");

  $monitor("Sa�das: %b",out);

   #1 clr = 1;
   #1 clr = 0;
   #1 clk = 1; addr = 1; rw = 1; in = 1;
   #1 clk = 1; addr = 1; rw = 1; in = 1;
   #1 addr = 0;
   #1 addr = 1;


end

endmodule //exemplo0076



