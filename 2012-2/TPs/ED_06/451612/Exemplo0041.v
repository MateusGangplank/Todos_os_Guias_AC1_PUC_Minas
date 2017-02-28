// -------------------------
// Exemplo0041 - GUIA-06
// Nome: Rodolfo Herman
// Matricula: 451612
// -------------------------
// -------------------------

// ---------------------------
// -- test clock generator (1)
// ---------------------------
module clock ( output clk );
reg clk;
initial begin
clk = 1'b0;
end
always
begin
#12 clk = ~clk;
end
endmodule // clock ( )
module Exemplo0041;
wire clk;
clock CLK1 ( clk );
initial begin
$dumpfile ( "Exemplo041.vcd" );
$dumpvars;
#120 $finish;
end
endmodule // Exemplo041 ( )