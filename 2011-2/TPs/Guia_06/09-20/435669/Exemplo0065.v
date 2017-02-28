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
05.) Projetar e descrever em Verilog um m�dulo 
gerador de pulso (p u lse ) com frequ�ncia igual 
ao triplo da frequ�ncia (um ter�o do per�odo)  
do gerador do Exemplo0041.v. 
O nome do arquivo dever� ser Exemplo0065.v. 
Incluir previs�o de testes e verifica��o da 
carta de tempo usando GTKWave. 
------------------------------------------------
*/
 
// ---------------------------
// -- test pulse generator (5)
// ---------------------------

//--------------------------------
module clock ( clk );

output clk;
reg    clk;

initial begin
   clk = 1'b0;
  end
always begin
   #8 clk = ~clk;
  end
endmodule
//--------------------------------
module pulse ( signal, clock );

input  clock;
output signal;
reg signal;

always @ ( clock ) begin
    signal = 1'b1;
#8  signal = 1'b0;
#8  signal = 1'b1;
#8  signal = 1'b0;
end
endmodule //pulse
//--------------------------------
module Exemplo0065;

wire  clock;
clock clk ( clock );
wire  p1;
pulse   pulse1   ( p1, clock );

initial begin
  $display  ( "Mateus Augusto Moraes Ferreira   Matricula:435669");
  $dumpfile ( "Exemplo0065.vcd" );
  $dumpvars ( 1, clock, p1);
#376 $finish;

end

endmodule // exemplo0065
//--------------------------------