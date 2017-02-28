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
04.) Projetar e descrever em Verilog um módulo 
para implementar uma máquina de estados finitos, 
segundo a abordagem de Mealy, capaz de reconhecer 
uma sequência (101) com interseção  
(10101 deverá ser reconhecida também). 
O nome do arquivo deverá ser Exemplo0072.v. 
Incluir previsão de testes e verificação do circuito 
pelo Logisim. 
--------------------------------------------------------------- 
*/
 
// -------------------- 
// --Exemplo0072
// -------------------- 
// 

`include "Exemplo0072_Mealy101.v" 

module Exemplo0072; 
reg clk, reset, x; 
wire m1; 

mealy101 mealy1 ( m1, x, clk, reset ); 


initial 
begin 
$display ( "Time    X  Mealy" ); 

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
end // always at positive edge clocking changing 

endmodule // Exemplo0072 

/*
Testes

Time   X  Mealy
 10    0    0
 20    1    0
 30    0    0
 40    1    0
 50    1    0
 60    0    0
 70    1    1
 80    1    0
 90    0    0
100    1    1
110    1    0
120    1    0
*/