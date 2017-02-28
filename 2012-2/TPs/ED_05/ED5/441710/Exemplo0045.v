// ------------------------- 
// Exemplo045
// Nome: Raphael Quintao 
// Matricula: 445171
// -------------------------
// ---------------------------
// -- test clock generator (3)
// ---------------------------
`include "clock.v"
module pulse1 ( signal, clock );
input clock;
output signal;
reg signal;
always @ ( clock )
begin
signal = 1'b1;
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
$dumpfile ( "Nome: Raphael Quintao Matricula: 445171" );
$dumpfile ( " Exemplo0045.vcd" );
$dumpvars ( 1, clock, p1);
#480 $finish;

end

endmodule // Exemplo0045