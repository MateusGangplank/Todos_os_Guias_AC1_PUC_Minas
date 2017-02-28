// NOME: TIAGO MATTA MACHADO ZAIDAN
// MATRICULA: 451620
// ---------------------------
// -- test clock generator (8)
// ---------------------------
`include "clock.v"
module pulse1 ( signal, clock );
input clock;
output signal;
reg signal;
always @ (clock)
begin
signal = 1'b1;
#5 signal = 1'b0;
end
endmodule // pulse
module Exemplo0048;
wire clock;
clock clk ( clock );
wire p1;
pulse1 pls1 ( p1, clock );
initial begin
$dumpfile ( "Exemplo0048.vcd" );
$dumpvars ( 1, clock, p1 );
#1 $display ( "Exemplo0048" );
#1 $display ( "Nome: Tiago Matta Machado Zaidan -- 451620" );
#480 $finish;
end
endmodule // Exemplo0048