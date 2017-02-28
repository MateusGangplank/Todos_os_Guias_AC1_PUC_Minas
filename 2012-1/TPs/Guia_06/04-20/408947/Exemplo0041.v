// ---------------------------
// Nome: Guilherme Moreira Nunes
//	Matricula: 408947
// --------------------------- 
// -- test clock generator (1) 
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


module Exemplo0041; 
wire clk; 
clock CLK1 ( clk );
 
initial begin

$display("Exercicio 01 - Guilherme Moreira Nunes - 408947");
$dumpfile ( "Exemplo041.vcd" ); 
$monitor($time, ,clk);
$dumpvars(0); 
#120 $finish; 
end 
endmodule // Exemplo041 ( ) 