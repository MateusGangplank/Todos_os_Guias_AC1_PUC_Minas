// -------------------------
// clock.v – Gerador de clock
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// ---------------------------
// -- clock generator (1)
// ---------------------------
module clock ( clk );
       output clk;
       reg clk;
       initial begin
               clk = 1'b0;
       end
       always begin
           #12 clk = ~clk;
       end
endmodule // clock ( )