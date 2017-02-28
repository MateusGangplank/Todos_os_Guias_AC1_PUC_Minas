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
05.) Projetar e descrever em Verilog um módulo 
para implementar uma máquina de estados finitos, 
segundo a abordagem de Moore, capaz de reconhecer 
uma sequência (1010) sem interseção  
(101010 não deverá ser reconhecida). 
O nome do arquivo deverá ser Exemplo0053.v. 
Incluir previsão de testes e verificação do circuito 
pelo Logisim. 
--------------------------------------------------------------- 
*/


// -------------------- 
// --- Exemplo0073
// -------------------- 
// 

`include "Exemplo0073_Moore1010.v" 

module Exemplo0053; 
reg clk, reset, x; 
wire m1; 

moore1010 moore1 ( m1, x, clk, reset ); 


initial 
begin 
$display ( "Tempo    X  Moore" ); 

// initial values 
clk = 1; 
reset = 0; 
x = 0; 

// input signal changing 
#5 reset = 1; 
#10 x = 1; 
#10 x = 0; 
#10 x = 1; 
#20 x = 0; 
#10 x = 1; 
#10 x = 1; 
#10 x = 0; 
#10 x = 1; 

#30 $finish; 
end // initial 

always 
#5 clk = ~clk; 

always @( posedge clk ) 
begin 
$display ( "%4d %4b %4b", $time, x, m1 ); 
end 

endmodule // Exemplo0053 

/*
Testes

 Time   X  Moore
  10    0    0
  20    1    0
  30    0    0
  40    1    0
  50    1    0
  60    0    0
  70    1    0
  80    1    1
  90    0    0
 100    1    0
 110    1    1
 120    1    0
*/