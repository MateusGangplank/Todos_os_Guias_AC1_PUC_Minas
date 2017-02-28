// ---------------
// Exemplo0043 - GERADOR DE CLOCK
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
  #4 signal = 1'b0;
  #4 signal = 1'b1;
  #4 signal = 1'b0;
  #4 signal = 1'b1;
  #4 signal = 1'b0;
end
endmodule // pulse1()

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
  #10 signal = 1'b0;
 end
endmodule // pulse2()

// ---------------
// Pulse 3
// ---------------
module pulse3 ( signal, clock );
input clock;
output signal;

reg signal;

always @ ( negedge clock )
 begin
  signal = 1'b1;
  #4 signal = 1'b0;
  #4signal = 1'b1;
 end
endmodule // pulse3()

// ---------------
// Pulse 4
// ---------------
module pulse4 ( signal, clock );
input clock;
output signal;

reg signal;

always @ ( negedge clock )
 begin
  signal = 1'b1;
  #12 signal = 1'b0;
  #12 signal = 1'b1;
  #12 signal = 1'b0;
 end
endmodule // pulse4()

// ---------------
// Exemplo0043
// ---------------
module Exemplo0043;

// --------------- Definição de dados
wire clock;
wire p1,p2,p3,p4;

// --------------- Intância
clock clk ( clock );
pulse1 pls1 ( p1, clock );
pulse2 pls2 ( p2, clock );
pulse3 pls3 ( p3, clock );
pulse4 pls4 ( p4, clock );

// --------------- Parte principal
initial begin
$dumpfile ("Exemplo0043.vcd");
$dumpvars ( 1, clock, p1, p2, p3, p4 );
#120 $finish;
end
endmodule // Exemplo0043