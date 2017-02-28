// -------------------------
// Exemplo0044 - GUIA-06
// Nome: Rodolfo Herman
// Matricula: 451612
// -------------------------
// -------------------------

// ---------------------------
// -- test clock generator (1)
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

module pulse ( output sinal, input clock );
//criar saida
reg sinal;
always  begin
sinal = 1'b1;
#4 sinal = 1'b0;
#4 sinal = 1'b1;
#4 sinal = 1'b0;
#4 sinal = 1'b1;
#4 sinal = 1'b0;
#4 sinal = 1'b1;
end
endmodule // pulse

module Exemplo0044;
wire c;
clock CLK1 ( c );
wire pulso;
pulse teste1 ( pulso, c );
initial begin
$dumpfile ( "Exemplo044.vcd" );
$dumpvars ( 1, c, pulso);
#60 $finish;
end
endmodule // Exemplo044 ( )