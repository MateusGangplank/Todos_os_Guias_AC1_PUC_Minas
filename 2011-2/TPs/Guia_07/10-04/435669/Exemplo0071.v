/*
PUC-Minas - Ciência da Computação 
ARQ1 – Guia 07 
Período: 12-16/09/2011 
--------------------------------------------------------------- 
Tema: Introdução à linguagem Verilog 
Atividade: Circuitos sequenciais – Máquinas de estado finito (FSM) 
--------------------------------------------------------------- 
Mateus Augusto Moraes Ferreira   Matricula:435669
---------------------------------------------------------------  
03.) Projetar e descrever em Verilog um módulo 
para testar as máquinas de estados finitos 
segundo as abordagens de Mealy e de Moore. 
O nome do arquivo deverá ser Exemplo0071.v,
e poderá seguir o modelo descrito abaixo. 
--------------------------------------------------------------- 
*/
 
// -------------------- 
// --- Mealy-Moore FSM 
// -------------------- 
// 
 
`include "mealy1101.v" 
`include "moore1101.v" 
 
module Exemplo0071; 
 reg   clk, reset, x; 
 wire  m1, m2; 
 
 mealy1101  mealy1  ( m1, x, clk, reset ); 
 moore1101 moore1 ( m2, x, clk, reset ); 
 
 initial 
  begin 
   $display ( "Time     X   Mealy Moore" ); 
 
// initial values 
       clk    = 1; 
       reset = 0; 
       x       = 0; 
 
// input signal changing 
  #5    reset = 1; 
  #10  x = 1; 
  #10  x = 0; 
  #10  x = 1; 
  #20  x = 0; 
  #10  x = 1; 
  #10  x = 1; 
  #10  x = 0; 
  #10  x = 1; 
 
  #30 $finish; 
 end // initial 
 
 always 
  #5 clk = ~clk; 
 
 always @( posedge clk ) 
  begin 
   $display ( "%4d  %4b  %4b %5b", $time, x, m1, m2 ); 
  end // always at positive edge clocking changing 
 
endmodule // Exemplo0071 