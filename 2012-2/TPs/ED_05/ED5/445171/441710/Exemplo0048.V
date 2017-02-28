//===============================
//-- Exemplo0048
//-- Aluno: Thais Mairink - 441710
//==================================


`include "clock.v"

module pulse ( output signal, output signal1,input clock ); 
 
reg signal, signal1; 

always @ ( negedge clock ) 
begin 
		signal = 1'b1; 
	#5 signal = 1'b0; 
end 

always @ ( posedge clock ) 
begin 
		signal1 = 1'b1; 
	#5 signal1 = 1'b0;
end
endmodule // pulse 

// ------------------------- definir dados 
module Exemplo0048; 

wire clock; 
clock clk ( clock ); 
reg p; 
wire p1, p2; 

pulse pulse1 ( p1, p2, clock ); 

// ------------------------- parte principal 
initial begin 
$dumpfile ( "Exemplo0048.vcd" ); 
$dumpvars ( 1, clock, p1, p2 ); 
#120 $finish; 

end 
endmodule // Exemplo0048
