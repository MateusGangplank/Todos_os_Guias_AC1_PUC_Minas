// ---------------------------------- 
// Exemplo0044 - Clock Pulse
// Nome: Alvaro Henrique de Araujo Rungue 
// Matricula: 395487
// ---------------------------------- 


// --------------------------- 
// -- test clock generator 
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
endmodule //-- Fim clock

module pulse ( signal, clock ); 

input clock; 
output signal; 
reg signal; 

always @ ( clock ) 
begin 
signal = 1'b1; 

#36 signal = 1'b0; 
#36 signal = 1'b1; 
#36 signal = 1'b0; 

end 
endmodule //-- pulse 

module Exemplo0044; 

wire clock; 
clock clk ( clock ); 
reg p; 
wire p1,t1; 

pulse pulse1 ( p1, clock ); 

initial begin 
p = 1'b0; 
end 

initial begin 
$display("Exemplo0044 - Alvaro Henrique de Araujo Rungue - 395487\n");
$dumpfile ( "Exemplo0044.vcd" ); 
$display("\nTempo - Clock - Pulso\n");
$monitor($time,,clock,,p1,,p); 
$dumpvars ( 1, clock, p1, p); 

#376 $finish; 

end 
endmodule //-- Exemplo0044