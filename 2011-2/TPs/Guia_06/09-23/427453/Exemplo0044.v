// ------------------------- 
// Exemplo0044 
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
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
	 
	module Exemplo0044; 
		wire clk; 
		clock CLK1 ( clk ); 
		initial begin 
			$dumpfile ( "Exemplo0044.vcd" ); 
			$dumpvars; 
		#120 $finish; 
		end 
	endmodule // Exemplo044 ( ) 