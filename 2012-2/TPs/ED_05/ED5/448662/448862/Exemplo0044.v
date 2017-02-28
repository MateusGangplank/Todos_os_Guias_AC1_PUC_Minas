// ---------------
// Exemplo0044 - GERADOR DE CLOCK
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 13/09/2012
// ----------------

// ---------------- Inclui o módulo clock
`include "clock.v"

// ---------------
// Pulse
// ---------------
module pulse ( signal, clock );
input clock;
output signal;

reg signal;

always @ ( posedge clock )
 begin
  signal = 1'b1;
  #40 signal = 1'b0;
  #40 signal = 1'b1;
  #40 signal = 1'b0;

end
endmodule // pulse()

// ---------------
// Exemplo0044
// ---------------
module Exemplo0044;

// --------------- Definição de dados
wire clock;
wire p;

// --------------- Intância
clock clk ( clock );
pulse pls ( p, clock );

// --------------- Parte principal
initial begin
$dumpfile ("Exemplo0044.vcd");
$dumpvars ( 1, clock, p );
#120 $finish;
end
endmodule // Exemplo0044