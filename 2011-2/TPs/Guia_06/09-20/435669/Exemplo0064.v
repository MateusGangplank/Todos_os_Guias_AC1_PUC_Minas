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
4.)Projetar e descrever em Verilog um m�dulo 
gerador de pulso (p u ls e) com frequ�ncia igual 
� metade da frequ�ncia (dobro do per�odo)  
do gerador do Exemplo0041.v. 
O nome do arquivo dever� ser Exemplo0064.v. 
Incluir previs�o de testes e verifica��o da 
carta de tempo usando GTKWave. 
------------------------------------------------
*/
 
// ---------------------------
// -- test pulse generator (4)
// ---------------------------

  module clock ( clk );
  output clk;
  reg    clk;

initial  begin
  
   clk = 1'b0;

end

always begin
   
	#24 clk = ~clk;

end

endmodule //clock

//--------------------------------

module pulse ( signal, clock );
input  clock;
output signal;
reg      signal;

always @ ( clock )
     begin
     signal = 1'b1;
#24  signal = 1'b0;
#24  signal = 1'b1;
#24  signal = 1'b0;

end

endmodule 

//--------------------------------

module Exemplo0064;
wire  clock;
clock clk ( clock );
wire  p1;
pulse   pulse1   ( p1, clock );

initial begin
  $display  ( "Mateus Augusto Moraes Ferreira  Matricula:435669");
  $dumpfile ( "Exemplo0064.vcd" );
  $dumpvars ( 1, clock, p1);

#376 $finish;

end

endmodule // exemplo0064
//--------------------------------