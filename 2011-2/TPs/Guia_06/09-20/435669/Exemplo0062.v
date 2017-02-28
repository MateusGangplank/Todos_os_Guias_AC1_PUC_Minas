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
2.)Projetar e descrever em Verilog m�dulos  
geradores de pulso (p u lse ) e gatilho (t rigg er). 
O nome do arquivo dever� ser Exemplo0062.v, 
e poder� seguir o modelo descrito abaixo. 
Incluir previs�o de testes e verifica��o da 
carta de tempo usando GTKWave. 
------------------------------------------------
*/
 
// --------------------------- 
// -- test clock generator (2) 
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
endmodule 
 
module pulse ( signal, clock ); 
 input  clock; 
 output signal; 
 reg      signal; 
 
 always @ ( clock ) 
  begin 
        signal = 1'b1; 
  #3  signal = 1'b0; 
  #3  signal = 1'b1; 
  #3  signal = 1'b0; 
  end 
endmodule // pulse 
 
module trigger ( signal, on, clock ); 
 input  on, clock; 
 output signal; 
 reg      signal; 
 
 always @ ( posedge clock & on ) 
  begin 
  #60 signal = 1'b1; 
  #60 signal = 1'b0; 
  end 
endmodule // trigger 
 
 
module Exemplo0062; 
 
 wire   clock; 
 clock clk ( clock ); 
 
 reg   p; 
 
 wire  p1,t1; 
 
 pulse   pulse1   ( p1, clock ); 
 trigger trigger1 ( t1, p, clock ); 
 
 initial begin 
   p = 1'b0; 
 end 
 
 initial begin 
  $display  ( "Mateus Augusto Moraes Ferreira  Matricula:435669");
  $dumpfile ( "Exemplo0062.vcd" ); 
  $dumpvars ( 1, clock, p1, p, t1 ); 
 
  #060 p = 1'b1; 
  #120 p = 1'b0; 
  #180 p = 1'b1; 
  #240 p = 1'b0; 
  #300 p = 1'b1; 
  #360 p = 1'b0; 
  #376 $finish; 
 end 
 
endmodule // Exemplo0062 