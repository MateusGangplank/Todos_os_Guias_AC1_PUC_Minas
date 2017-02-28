// ------------------------- 
// -- Nome: Camila Guedes Silveira 
// -- Matricula: 427393 
// ------------------------- 

// --------------------------- 
// -- test clock generator (4) 
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

module pulse ( signal, clock ); 
	input clock; 
	output signal; 
	reg signal; 
	
	always @ ( clock ) 
	begin 
		signal = 1'b1; 
		#6 signal = 1'b0; 
		#6 signal = 1'b1; 
		#6 signal = 1'b0; 
	end 
endmodule // pulse  

module Exemplo0044; 
	
	wire clk; 
	clock CLK1 ( clk ); 
		 
	reg p; 
	pulse pulse1 ( p1, clk ); 
	
	initial begin 
		p = 1'b0; 
	end
	
	initial begin 
		$display("Exemplo0044 - Camila Guedes Silveira - 427393");
		$dumpfile ( "Exemplo0044.vcd" ); 
		$dumpvars(0);
		
		$monitor("freq. clock: %b    freq. pulso: %b", clk, p);
		
		#120 $finish; 
	end 
endmodule // Exemplo0044 ( ) 