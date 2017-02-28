// NOME: TIAGO MATTA MACHADO ZAIDAN
// MATRICULA: 451620
// ---------------------------
// -- test clock generator (1)
// -- Exemplo0041
// ---------------------------
module clock ( clk );
output clk;
reg clk;
initial
begin
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
$dumpfile ( "Exemplo0041.vcd" );
$dumpvars;
#1 $display ( "Exemplo0041" );
#1 $display ( "Nome: Tiago Matta Machado Zaidan -- 451620" );
#120 $finish;
end
endmodule // Exemplo0041 ( )