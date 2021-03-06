// ---------------------------
// Exemplo0047
// Nome: Patrick Fl�vio Teixeira Coura
//	Matricula: 427450
// --------------------------- 
`include "Clock.v"

 
module pulse ( signal, clock ); 
input clock; 
output signal; 
reg signal; 

always @ ( clock ) begin 
signal = 1'b0; 
#6 signal = 1'b0; 
#6 signal = 1'b0; 
#6 signal = 1'b1; 
end 

endmodule // pulse 

module Exemplo0047; 
wire clock; 
clock clk ( clock ); 
reg p; 
wire p1; 
pulse pulse1 ( p1, clock ); 

initial begin 
p = 1'b0; 
end 

initial begin 
$display("Exemplo0047");
$display("Aluno:  Patrick Fl�vio Teixeira Coura - Matricula: 427450");
$dumpfile ("Exemplo047.vcd");
$monitor($time,,clock,,p1,,p); 
$dumpvars ( 1, clock, p1, p); 

#240 $finish;
 
end 
endmodule 