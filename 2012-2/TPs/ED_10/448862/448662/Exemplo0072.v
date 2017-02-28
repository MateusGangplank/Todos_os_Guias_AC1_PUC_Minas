// ---------------
// Exemplo0072 - Circuitos sequ�nciais - Flip-Flops
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// pulse: 08/10/2012
// ----------------

`include "Exemplo0071.v"

// ----------------
// Mem�ria RAM 2x4
// ----------------
module memoria2x4(output [3:0]out0, output [3:0]out1, input clk, input addr, input rw, input in, input preset, input clr);

wire addr_n;

not not1(addr_n, addr);

// Chamada das mem�rias 1x4
memoria1x4 m1(out0, clk, addr_n, rw, in, preset, clr);
memoria1x4 m2(out1, clk, addr, rw, in, preset, clr);

endmodule //memoria2x4

// ----------------
// Exemplo0072
// ----------------
module exemplo0072;

// ---------------- Defini��o de dados
wire [3:0]out0, out1;
reg clk, addr, rw, in, preset, clr;

// ---------------- Inst�ncia
 memoria2x4 memo2_4(out0, out1, clk, addr, rw, in, preset, clr);

// ---------------- Prepara��o
 initial begin: start
  clk = 1;
  addr = 0;
  rw = 0;
  in = 0;
  preset = 1;
  clr = 0;
 end
 
// ---------------- Parte principal
 initial begin: main
  $display("Exemplo0072 - Josemar Alves Caetano - 448662.");
  $display("Teste Mem�ria RAM 2x4.\n");

  $display("Sa�das: 0\te\t1\n");
  $monitor("\t%b\t\t%b\n",out0, out1);

   #1 clr = 1;
   #1 clr = 0;
   #1 clk = 1; addr = 0; rw = 1; in = 1;
   #1 clk = 1; addr = 1; rw = 1; in = 1;
   #1 addr = 0;
   #1 addr = 1;

end

endmodule //exemplo0072



