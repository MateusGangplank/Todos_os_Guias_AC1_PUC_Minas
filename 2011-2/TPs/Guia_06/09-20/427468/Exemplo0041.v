// ---------------------------
// Exemplo0041
// Nome: Ursula Rosa Monteiro de Castro
// Matricula: 427468  

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

$display("Exemplo0041 - Ursula Rosa - 427468");
$dumpfile ( "Exemplo0041.vcd" ); 
$monitor($time, clk);
$dumpvars(0); 
#120 $finish; 
end 
endmodule // Exemplo0041 ( ) 