// NOME: TIAGO MATTA MACHADO ZAIDAN
// MATRICULA: 451620
// ---------------------------
// -- test clock generator (5)
// ---------------------------
`include "clock.v"
module pulse1 ( signal, clock );
input clock;
output signal;
reg signal;
always @ ( posedge clock )
begin
signal = 1'b1;
#24 signal = 1'b0;
#24 signal = 1'b1;
#24 signal = 1'b0;
#24 signal = 1'b1;
#24 signal = 1'b0;
#24 signal = 1'b1;
#24 signal = 1'b0;
#24 signal = 1'b1;
end
endmodule // pulse
module Exemplo0045;
wire clock;
clock clk ( clock );
wire p1;
pulse1 pls1 ( p1, clock );
initial begin
$dumpfile ( "Exemplo0045.vcd" );
$dumpvars ( 1, clock, p1 );
#1 $display ( "Exemplo0045" );
#1 $display ( "Nome: Tiago Matta Machado Zaidan -- 451620" );
#480 $finish;
end
endmodule // Exemplo0045