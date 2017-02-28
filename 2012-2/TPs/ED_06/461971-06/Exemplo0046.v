// ---------------------------
// -- test clock generator (6)
// Herbert Alves Batista - 461971
// ---------------------------
`include "clock.v"
module pulse ( signal, clock );
input clock;
output signal;
reg signal;
always @ ( posedge clock )
begin
signal = 1'b1;
#5signal = 1'b0;

end
endmodule // pulse
module Exemplo0046;
wire clk;
clock CLK1 ( clk );
wire p1;
pulse pulse1 ( p1, clk );
initial begin
$dumpfile ( "Exemplo0046.vcd" );
$dumpvars;
#1200 $finish;
end
endmodule // Exemplo041 ( )