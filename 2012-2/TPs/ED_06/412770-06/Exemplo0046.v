// -------------------------
// Exemplo0046 - F4
// Nome: Rayan Darwin
// Matricula: 412770
// -------------------------

// ---------------------------
// -- test clock generator (3)
// ---------------------------
`include "clock.v"

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
endmodule // pulse

module pulse2 ( signal, clock );
input clock;
output signal;
reg signal;
always @ ( posedge clock )
begin
signal = 1'b1;
#5 signal = 1'b0;
end
endmodule // pulse

module pulse3 ( signal, clock );
input clock;
output signal;
reg signal;
always @ ( negedge clock )
begin
signal = 1'b1;
#15 signal = 1'b0;
#15 signal = 1'b1;
end
endmodule // pulse

module pulse4 ( signal, clock );
input clock;
output signal;
reg signal;
always @ ( negedge clock )
begin
signal = 1'b1;
#20 signal = 1'b0;
#20 signal = 1'b1;
#20 signal = 1'b0;
end
endmodule // pulse

module pulseUmTerco ( signal, clock );
input clock;
output signal;
reg signal;
always @ ( negedge clock )
begin
signal = 1'b1;
#4 signal = 1'b0;
#4 signal = 1'b1;
#4 signal = 1'b0;
end
endmodule // pulse

module pulseMetade ( signal, clock );
input clock;
output signal;
reg signal;
always @ ( negedge clock )
begin
signal = 1'b1;
#6 signal = 1'b0;
#6 signal = 1'b1;
#6 signal = 1'b0;
end
endmodule // pulse

module pulseCincoUnidades ( signal, clock );
input clock;
output signal;
reg signal;
always @ ( clock )
begin
signal = 1'b1;
#5 signal = 1'b0;
#5 signal = 1'b1;
#5 signal = 1'b0;
end
endmodule // pulse

module Exemplo0043;
wire clock;
clock clk ( clock );
wire p1,p2,p3,p4;
pulse1 pls1 ( p1, clock );
pulse2 pls2 ( p2, clock );
pulse3 pls3 ( p3, clock );
pulse4 pls4 ( p4, clock );
pulseUmTerco pls5 (p5, clock);
pulseMetade pls6 ( p6, clock );
pulseCincoUnidades pls7 (p7, clock);
initial begin
$dumpfile ( " Exemplo0046.vcd" );
$dumpvars ( 1, clock, p1, p2, p3, p4, p5, p6 );
#480 $finish;
end
endmodule // Exemplo0043