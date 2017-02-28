// ---------------------------------- 
// Exemplo0041 - Clock
// Nome: Alvaro Henrique de Araujo Rungue 
// Matricula: 395487
// ---------------------------------- 

// --------------------------- 
// -- test clock generator (1) 
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

endmodule //-- clock ( ) 

module Exemplo0041; 

wire clk; 
clock CLK1 ( clk ); 
initial begin 
$display("Exemplo0041 - Alvaro Henrique de Araujo Rungue - 395487");
$dumpfile ( "Exemplo0041.vcd" ); 
$dumpvars; 

//-- Tamanho da Duracao
#120 $finish; 

end 
endmodule //-- Exemplo041 ( ) 