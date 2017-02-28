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
06.) Projetar e descrever em Verilog um módulo 
gerador de pulso (p u lse ) com frequência igual 
a 6 unidades de tempo, sincronizado com a 
borda de subida do gerador do Exemplo0041.v. 
O nome do arquivo deverá ser Exemplo0066.v. 
Incluir previsão de testes e verificação da 
carta de tempo usando GTKWave. 
------------------------------------------------
*/
 
// ---------------------------
// -- test pulse generator (6)
// ---------------------------

// ---------------------------
module clock ( clk );

output clk;
reg    clk;

initial begin
  clk = 1'b0;
  end
  
always begin
   #6 clk = ~clk;
  end
  
endmodule// clock

// ---------------------------
module pulse ( signal, clock );

input  clock;
output signal;
reg     signal;

always @ ( clock ) begin
    signal = 1'b0;
#6  signal = 1'b1;
#6  signal = 1'b0;
#6  signal = 1'b1;

end

endmodule // pulse
// ---------------------------
module Exemplo0066;

wire  clock;
clock clk ( clock );
wire  p1;
pulse   pulse1   ( p1, clock );

initial begin
  $display  ( "Mateus Augusto Moraes Ferreira  Matricula:435669");
  $dumpfile ( "Exemplo0066.vcd" );
  $dumpvars ( 1, clock, p1);
#376 $finish;

end

endmodule //exemplo0066
// ---------------------------