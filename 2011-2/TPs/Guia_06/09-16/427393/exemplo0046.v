// -------------------------
// -- Nome: Camila Guedes Silveira 
// -- Matricula: 427393 
// ------------------------- 

// --------------------------- 
// -- test clock generator (6) 
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
	
//	always @ ( clock )
// EXPERIMENTE
	always @ ( posedge clock )
	begin
		signal = 1'b1;
		#3 signal = 1'b0; 
		#3 signal = 1'b1; 
		#3 signal = 1'b0;
				
				
	end 
endmodule // pulse  

// -- não consegui sicronizar a frequencia do pulso com a borda de subida do clock.

module Exemplo0046; 
	
	wire clk; 
	clock CLK1 ( clk ); 
		 
	reg p; 
	pulse pulse1 ( p1, clk ); 
	
	initial begin 
		p = 1'b0; 
	end
	
	initial begin 
		$display("Exemplo0046 - Camila Guedes Silveira - 427393");
		$dumpfile ( "Exemplo0046.vcd" ); 
		$dumpvars(0);
		
		$monitor("freq. clock: %b    freq. pulso: %b", clk, p);
		
		#120 $finish; 
	end 
endmodule // Exemplo0046 ( ) 