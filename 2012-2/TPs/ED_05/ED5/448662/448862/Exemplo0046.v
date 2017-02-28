// ---------------
// Exemplo0046 - GERADOR DE PULSOS
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 13/09/2012
// ----------------

// ---------------- Inclui o módulo clock
`include "clock.v"

// ---------------
// Pulse 2
// ---------------
module pulse2 ( signal, clock );
input clock;
output signal;

reg signal;

always @ ( posedge clock )
 begin
  signal = 1'b1;
  #5 signal = 1'b0;

end
endmodule // pulse2()

// ---------------
// Exemplo0046
// ---------------
module Exemplo0046;

// --------------- Definição de dados
wire clock;
wire p;

// --------------- Intância
clock clk ( clock );
pulse2 pls2 ( p, clock );

// --------------- Parte principal
initial begin
$dumpfile ("Exemplo0046.vcd");
$dumpvars ( 1, clock, p );
#120 $finish;
end
endmodule // Exemplo0046