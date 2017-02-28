/*
-------------------------------------
PUC-Minas - Ci�ncia da Computa��o 
ARQ1 � Guia 06 
Per�odo: 05-09/09/2011 
Mateus Augusto Moraes Ferreira   Matricula:435669
------------------------------------- 
Tema: Introdu��o � linguagem Verilog 
Atividade: Circuitos sequenciais 
------------------------------------------------
01.) Projetar e descrever em Verilog um m�dulo 
gerador de clock . 
O nome do arquivo dever� ser Exemplo0061.v, 
e poder� seguir o modelo descrito abaixo. 
Incluir previs�o de testes e verifica��o da 
carta de tempo usando GTKWave. 
------------------------------------------------
*/
 
// --------------------------- 
// -- test clock generator (1) 
// --------------------------- 
 
module clock ( clk ); 
 output clk; 
 reg      clk; 
 
 initial 
  begin 
   clk = 1'b0; 
  end 
 
 always 
  begin 
   #12 clk = ~clk; 
  end 
 
endmodule // clock ( ) 
 
module Exemplo0061; 
 
 wire  clk; 
 clock CLK1 ( clk ); 
 
 initial begin 
  $display  ("Mateus Augusto Moraes Ferreira   Matricula:435669");
  $dumpfile ( "Exemplo0061.vcd" ); 
  $dumpvars; 
 
  #120 $finish; 
 end 
 
endmodule // Exemplo0061 ( ) 
 