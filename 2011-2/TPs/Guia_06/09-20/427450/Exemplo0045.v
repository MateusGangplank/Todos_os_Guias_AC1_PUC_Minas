// ---------------------------
// Exemplo0045
// Nome: Patrick Flávio Teixeira Coura
//	Matricula: 427450
// --------------------------- 
`include "Clock.v"

 
module pulse ( signal, clock ); 
input clock; 
output signal; 
reg signal; 

always @ ( clock ) begin 
signal = 1'b1; 
#4 signal = 1'b0; 
#4 signal = 1'b1; 
#4 signal = 1'b0; 
end 

endmodule // pulse 

module Exemplo0045; 
wire clock; 
clock clk ( clock ); 
reg p; 
wire p1; 
pulse pulse1 ( p1, clock ); 

initial begin 
p = 1'b0; 
end 

initial begin 
$display("Exemplo0045");
$display("Aluno:  Patrick Flávio Teixeira Coura - Matricula: 427450");
$dumpfile ("Exemplo045.vcd");
$monitor($time,,clock,,p1,,p); 
$dumpvars ( 1, clock, p1, p); 

#240 $finish; 
end 
endmodule 