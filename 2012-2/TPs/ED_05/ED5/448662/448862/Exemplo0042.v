// ---------------
// Exemplo0042 - GERADOR DE CLOCK
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 09/09/2012
// ----------------

// --------------- Inclui módulo de clock
`include "clock.v"

// ---------------
// Pulse
// ---------------
module pulse ( signal, clock );
input clock;
output signal;

reg signal;

always @ ( clock )
 begin
  signal = 1'b1;
  #3 signal = 1'b0;
  #3 signal = 1'b1;
  #3 signal = 1'b0;
 end

endmodule // pulse ( )

// ---------------
// Trigger
// ---------------
module trigger ( signal, on, clock );
input on, clock;
output signal;

reg signal;

always @ ( posedge clock & on )
 begin
  #60 signal = 1'b1;
  #60 signal = 1'b0;
 end
endmodule // trigger( )

// ---------------
// Exemplo0042
// ---------------
module Exemplo0042;

// --------------- Definição de dados
wire clock;
reg p;
wire p1,t1;
// --------------- Instância
clock clk ( clock );
pulse pulse1 ( p1, clock );
trigger trigger1 ( t1, p, clock );
// --------------- Preparação
 initial begin : main
 p = 1'b0;
end
// --------------- Parte principal
initial begin
$dumpfile ( "Exemplo0042.vcd" );
$dumpvars ( 1, clock, p1, p, t1 );
#060 p = 1'b1;
#120 p = 1'b0;
#180 p = 1'b1;
#240 p = 1'b0;
#300 p = 1'b1;
#360 p = 1'b0;
#376 $finish;
end
endmodule // Exemplo0042