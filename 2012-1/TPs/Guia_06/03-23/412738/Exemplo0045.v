// --------------------------- 
// -- test clock generator (5) 
// ---------------------------
// Nome: Felipe Tôrres
// Matricula: 412738 

`include "clock.v" 
module pulse1 ( signal, clock ); 
input clock; 
output signal; 
reg signal; 
always @ ( posedge clock ) 
begin 
signal = 1'b1; 
#60 signal = 1'b0; 
#60 signal = 1'b1; 
#60 signal = 1'b0; 
#60 signal = 1'b1; 
#60 signal = 1'b0; 
end 
endmodule // pulse 
module pulse2 ( signal, clock ); 
input clock; 
output signal; 
reg signal; 
always @ ( posedge clock ) 
begin 
signal = 1'b1; 
#60 signal = 1'b0; 
end 
endmodule // pulse 
module pulse3 ( signal, clock ); 
input clock; 
output signal; 
reg signal; 
always @ ( negedge clock ) 
begin 
signal = 1'b1; 
#60 signal = 1'b0; 
#60 signal = 1'b1; 
end 
endmodule 
module pulse4 ( signal, clock ); 
input clock; 
output signal; 
reg signal; 
always @ ( negedge clock ) 
begin 
signal = 1'b1; 
#60 signal = 1'b0; 
#60 signal = 1'b1; 
#60 signal = 1'b0; 
end 
endmodule 
module Exemplo0045; 
wire clock; 
clock clk ( clock ); 
wire p1,p2,p3,p4; 
pulse1 pls1 ( p1, clock ); 
pulse2 pls2 ( p2, clock ); 
pulse3 pls3 ( p3, clock ); 
pulse4 pls4 ( p4, clock ); 
initial begin 
$dumpfile ( "Exemplo0045.vcd" ); 
$dumpvars ( 1, clock, p1, p2, p3, p4 ); 
#480 $finish; 
end 
endmodule 