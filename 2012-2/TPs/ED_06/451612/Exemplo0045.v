// -------------------------
// Exemplo0045 - GUIA-06
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

//gerador de pulso
module pulse ( output sinal, input clock );
//criar saida
reg sinal;
always begin
sinal = 1'b1;
#24 sinal = 1'b0;
#24 sinal = 1'b1;
end
endmodule // pulse

module Exemplo0045;
wire c;
clock CLK1 ( c );
wire pulso;
pulse teste1 ( pulso, c );
initial begin
$dumpfile ( "Exemplo045.vcd" );
$dumpvars ( 1, c, pulso);
#72 $finish;
end
endmodule // Exemplo045 ( )