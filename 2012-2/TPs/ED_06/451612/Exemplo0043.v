// -------------------------
// Exemplo0043 - GUIA-06
// Nome: Rodolfo Herman
// Matricula: 451612
// -------------------------
// -------------------------


// ---------------------------
// -- test clock generator (3)
// ---------------------------
module clock ( clk );
output clk;
reg clk;
initial begin
clk = 1'b0;
end
always
begin
#12 clk = ~clk;
end
endmodule // clock ( )

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
module Exemplo0043;
wire c;
clock clk ( c );
wire p1,p2,p3,p4;
pulse1 pls1 ( p1, c );
pulse2 pls2 ( p2, c );
pulse3 pls3 ( p3, c );
pulse4 pls4 ( p4, c );
initial begin
$dumpfile ( "Exemplo0043.vcd" );
$dumpvars ( 1, c, p1, p2, p3, p4 );
#480 $finish;
end
endmodule // Exemplo0043