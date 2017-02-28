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