// ------------------------- 
// -- Nome: Camila Guedes Silveira 
// -- Matricula: 427393 
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
			#12 clk = ~clk; 
		end 
endmodule // clock ( ) 

module Exemplo0041; 
	
	wire clk; 
	clock CLK1 ( clk ); 
	
	initial begin 
		$display("Exemplo0041 - Camila Guedes Silveira - 427393");
		$dumpfile ( "Exemplo0041.vcd" ); 
		$dumpvars(0);
		
		$monitor("%b", clk);
		
		#120 $finish; 
	end 
endmodule // Exemplo0041 ( ) 