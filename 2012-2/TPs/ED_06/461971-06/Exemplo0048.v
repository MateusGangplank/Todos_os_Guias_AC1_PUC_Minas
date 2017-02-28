// ---------------------------
// -- test clock generator (8)
// Herbert Alves Batista - 461971
// ---------------------------
`include "clock.v"
module pulse ( signal, clock );
input clock;
output signal;
reg signal;
always @ ( clock )
begin
signal = 1'b1;
#5signal = 1'b0;

end
endmodule // pulse
module Exemplo0048;
wire clk;
clock CLK1 ( clk );
wire p1;
pulse pulse1 ( p1, clk );
initial begin
$dumpfile ( "Exemplo0048.vcd" );
$dumpvars;
#1200 $finish;
end
endmodule // Exemplo047 ( )