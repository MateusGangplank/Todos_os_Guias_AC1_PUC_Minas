// ---------------------------
// -- test clock generator (5)
// Herbert Alves Batista - 461971
// ---------------------------
`include "clock.v"
module pulse ( signal, clock );
input clock;
output signal;
reg signal;
always @ ( posedge clock )
begin
if ( signal == 1 )
begin
signal <= 0;
end
else
begin
signal <= 1;
end
end
endmodule // pulse
module Exemplo0045;
wire clk;
clock CLK1 ( clk );
wire p1;
pulse pulse1 ( p1, clk );
initial begin
$dumpfile ( "Exemplo0045.vcd" );
$dumpvars;
#1200 $finish;
end
endmodule // Exemplo041 ( )