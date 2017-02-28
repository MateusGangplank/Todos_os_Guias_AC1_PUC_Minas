// ---------------
// Exemplo0048 - GERADOR DE PULSOS
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// Data: 13/09/2012
// ----------------

// ---------------- Inclui o m�dulo clock
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

// --------------- Defini��o de dados
wire clock;
wire p;

// --------------- Int�ncia
clock clk ( clock );
pulse4 pls4 ( p, clock );

// --------------- Parte principal
initial begin
$dumpfile ("Exemplo0048.vcd");
$dumpvars ( 1, clock, p );
#120 $finish;
end
endmodule // Exemplo0048