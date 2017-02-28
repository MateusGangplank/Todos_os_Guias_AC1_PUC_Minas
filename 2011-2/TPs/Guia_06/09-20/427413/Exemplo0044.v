 // ------------------------- 
// Exemplo0044
// Nome: Gustavo Jota Resende
// Matricula: 427413
// -------------------------

// --------------------------- 
// -- test clock generator (1) 
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
#6 clk = ~clk; 
end 
endmodule // clock ( ) 

// --------------------------- 
// -- module pulse 
// --------------------------- 		
	module pulse ( signal, clock ); 
		input clock; 
		output signal; 
		reg signal; 
		always @ ( clock ) 
		begin 
		signal = 1'b1; 
		#3 signal = 1'b0; 
		#3 signal = 1'b1; 
		#3 signal = 1'b0; 
		end 
	endmodule // pulse
	
// --------------------------- 
// -- module Exemplo0044
// --------------------------- 
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
		$dumpfile ( "Exemplo0044.vcd" ); 
		$dumpvars ( 1, clock, p1, p ); 
		#060 p = 1'b1; 
		#120 p = 1'b0; 
		#180 p = 1'b1; 
		#240 p = 1'b0; 
		#300 p = 1'b1; 
		#360 p = 1'b0; 
		#376 $finish; 
		end 
	endmodule // Exemplo0044	
	
//--Teste
// --VCD info: dumpfile Exemplo044.vcd opened for output. 	