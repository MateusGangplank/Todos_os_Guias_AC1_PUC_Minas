/* 
PUC-Minas - Ci�ncia da Computa��o 
ARQ1 � Guia 07 
Per�odo: 12-16/09/2011 
--------------------------------------------------------------- 
Tema: Introdu��o � linguagem Verilog 
Atividade: Circuitos sequenciais � M�quinas de estado finito (FSM) 
--------------------------------------------------------------- 
Mateus Augusto Moraes Ferreira   Matricula:435669
---------------------------------------------------------------  
05.) Projetar e descrever em Verilog um m�dulo 
para implementar uma m�quina de estados finitos, 
segundo a abordagem de Moore, capaz de reconhecer 
uma sequ�ncia (1010) sem interse��o  
(101010 n�o dever� ser reconhecida). 
O nome do arquivo dever� ser Exemplo0053.v. 
Incluir previs�o de testes e verifica��o do circuito 
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