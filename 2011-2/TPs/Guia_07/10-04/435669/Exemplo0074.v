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
06.) Projetar e descrever em Verilog um m�dulo 
para implementar uma m�quina de estados finitos, 
capaz de reconhecer a primeira sequ�ncia 
(0111) que aparecer. 
O nome do arquivo dever� ser Exemplo0054.v. 
Incluir previs�o de testes e verifica��o do circuito 
pelo Logisim. 
--------------------------------------------------------------- 
*/

// -------------------- 
// --Exemplo0074
// -------------------- 
// 

`include "Exemplo0074_Mealy0111.v" 

module Exemplo0074; 
reg clk, reset, x; 
wire m1; 

mealy0111 mealy1 ( m1, x, clk, reset ); 


initial 
begin 
$display ( "Time    X  Mealy" ); 

// initial values 
clk = 1; 
reset = 0; 
x = 0; 

// input signal changing 
#5 reset = 0; 
#10 x = 0; 
#10 x = 1; 
#10 x = 1; 
#20 x = 1; 
#10 x = 0; 
#10 x = 1; 
#10 x = 1; 
#10 x = 1; 

#30 $finish; 
end // initial 

always 
#5 clk = ~clk; 

always @( posedge clk ) 
begin 
$display ( "%4d %4b %4b", $time, x, m1 ); 
end // always at positive edge clocking changing 

endmodule // Exemplo0074