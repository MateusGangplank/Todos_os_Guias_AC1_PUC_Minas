//===============================
//-- Exemplo0045
//-- Aluno: Thais Mairink - 441710
//==================================

`include "clock.v"

module pulse ( output signal, input clock ); 

reg signal; 

always @ ( clock ) 
begin 
		signal = 1'b1; 
	#24 signal = 1'b0; 
	#24 signal = 1'b1; 
	#24 signal = 1'b0; 
end 

endmodule // pulse 

// ------------------------- definir dados 
module Exemplo0045; 

wire clock; 
clock clk ( clock ); 
reg p; 
wire p1; 

pulse pulse1 ( p1, clock ); 

// ------------------------- parte principal 
initial begin 
$dumpfile ( "Exemplo0045.vcd" ); 
$dumpvars ( 1, clock, p1 ); 
#120 $finish; 

end 
endmodule // Exemplo0045