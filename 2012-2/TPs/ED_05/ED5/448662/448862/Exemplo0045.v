// ---------------
// Exemplo0045 - GERADOR DE CLOCK
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 13/09/2012
// ----------------

// ---------------- Inclui o módulo clock
`include "clock.v"

// ---------------
// Pulse 1
// ---------------
module pulse1 ( signal, clock );
input clock;
output signal;

reg signal;

always @ ( posedge clock )
 begin
  signal = 1'b1;
  #60 signal = 1'b0;
  #60 signal = 1'b1;
  #60 signal = 1'b0;

end
endmodule // pulse1()

// ---------------
// Exemplo0045
// ---------------
module Exemplo0045;

// --------------- Definição de dados
wire clock;
wire p;

// --------------- Intância
clock clk ( clock );
pulse1 pls1 ( p, clock );

// --------------- Parte principal
initial begin
$dumpfile ("Exemplo0045.vcd");
$dumpvars ( 1, clock, p );
#120 $finish;
end
endmodule // Exemplo0045