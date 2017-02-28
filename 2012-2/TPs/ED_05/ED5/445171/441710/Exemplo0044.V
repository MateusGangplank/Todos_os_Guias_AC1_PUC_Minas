//===============================
//-- Exemplo0044
//-- Aluno: Thais Mairink - 441710
//==================================


`include "clock.V"

module pulse ( output signal, input clock ); 

reg signal; 

always @ ( clock ) 
begin 
		signal = 1'b1; 
	#4 signal = 1'b0; 
	#4 signal = 1'b1; 
	#4 signal = 1'b0; 
end 

endmodule // pulse 

 
module Exemplo0044; 

wire clock; 
clock clk ( clock ); 
reg p; 
wire p1;
 
pulse pulse1 ( p1, clock ); 


initial begin 
$dumpfile ( "Exemplo0044.vcd" ); 
$dumpvars ( 1, clock, p1 ); 
#120 $finish; 

end 
endmodule // Exemplo0044
