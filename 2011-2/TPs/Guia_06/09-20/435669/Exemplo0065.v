/*
-------------------------------------
PUC-Minas - Ciência da Computação 
ARQ1 – Guia 06 
Período: 05-09/09/2011 
Mateus Augusto Moraes Ferreira   Matricula:435669
------------------------------------- 
Tema: Introdução à linguagem Verilog 
Atividade: Circuitos sequenciais 
------------------------------------------------
05.) Projetar e descrever em Verilog um módulo 
gerador de pulso (p u lse ) com frequência igual 
ao triplo da frequência (um terço do período)  
do gerador do Exemplo0041.v. 
O nome do arquivo deverá ser Exemplo0065.v. 
Incluir previsão de testes e verificação da 
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