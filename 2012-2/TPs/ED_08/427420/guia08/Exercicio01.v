// --------------------
// --- Deslocamento para esquerda
// --- Jenifer Henrique - 427420
// --- Exercicio 01
// --------------------

`include "Flipflops.v"
`include "clock.v"

module Exercicio01 

wire [4:0] qnot;

  //dff ( output q, output qnot,input d, input clk );
dff etapa1 ( s[4],qnot[4],data,clk );  
dff etapa1 ( s[3],qnot[3],s[4], clk );
dff etapa2 ( s[2],qnot[2],s[3], clk );
dff etapa3 ( s[1],qnot[1],s[2], clk );
dff etapa4 ( s[0],qnot[0],s[1], clk );

endmodule
