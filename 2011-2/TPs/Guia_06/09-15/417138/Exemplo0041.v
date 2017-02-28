// ---------------------------
// Luiz Marques de oliveira
//	Exercicio1
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

$display("Exercicio 01 - Luiz Marques de oliveira");
$dumpfile ( "Exemplo041.vcd" ); 
$monitor($time, ,clk);
$dumpvars(0); 
#120 $finish; 
end 
endmodule // Exemplo041 ( ) 