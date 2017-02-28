// ---------------
// Exemplo0042 - GERADOR DE CLOCK
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 09/09/2012
// ----------------

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