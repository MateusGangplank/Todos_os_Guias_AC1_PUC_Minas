// ---------------
// Exemplo0047 - GERADOR DE PULSOS
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// Data: 13/09/2012
// ----------------

// ---------------- Inclui o m�dulo clock
`include "clock.v"

// ---------------
// Pulse 3
// ---------------
module pulse3 ( signal, clock );
input clock;
output signal;

reg signal;

always @ ( negedge clock )
 begin
  signal = 1'b0;
  #5 signal = 1'b1;

end
endmodule // pulse3()

// ---------------
// Exemplo0047
// ---------------
module Exemplo0047;

// --------------- Defini��o de dados
wire clock;
wire p;

// --------------- Int�ncia
clock clk ( clock );
pulse3 pls3 ( p, clock );

// --------------- Parte principal
initial begin
$dumpfile ("Exemplo0047.vcd");
$dumpvars ( 1, clock, p );
#120 $finish;
end
endmodule // Exemplo0047