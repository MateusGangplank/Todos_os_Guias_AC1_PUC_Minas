//===============================
//-- Exemplo0047
//-- Aluno: Thais Mairink - 441710
//==================================

`include "clock.v"

module pulse ( output signal,input clock ); 

reg signal; 

always @ ( negedge clock ) 
begin 
		signal = 1'b1; 
	#5 signal = 1'b0; 
 
end 

endmodule // pulse 

// ------------------------- definir dados 
module Exemplo0047; 

wire clock; 
clock clk ( clock ); 
reg p; 
wire p1; 

pulse pulse1 ( p1, clock );
 
// ------------------------- parte principal 
initial begin 
$dumpfile ( "Exemplo0047.vcd" ); 
$dumpvars ( 1, clock, p1 ); 
#120 $finish; 

end 
endmodule // Exemplo0047
