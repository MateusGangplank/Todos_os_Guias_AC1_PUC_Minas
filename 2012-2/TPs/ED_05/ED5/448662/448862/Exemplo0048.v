// ---------------
// Exemplo0048 - GERADOR DE PULSOS
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 13/09/2012
// ----------------

// ---------------- Inclui o módulo clock
`include "clock.v"

// ---------------
// Pulse 4
// ---------------
module pulse4 ( signal, clock );
input clock;
output signal;

reg signal;

always @ ( clock )
 begin
  signal = clock;

end
endmodule // pulse4()

// ---------------
// Exemplo0048
// ---------------
module Exemplo0048;

// --------------- Definição de dados
wire clock;
wire p;

// --------------- Intância
clock clk ( clock );
pulse4 pls4 ( p, clock );

// --------------- Parte principal
initial begin
$dumpfile ("Exemplo0048.vcd");
$dumpvars ( 1, clock, p );
#120 $finish;
end
endmodule // Exemplo0048