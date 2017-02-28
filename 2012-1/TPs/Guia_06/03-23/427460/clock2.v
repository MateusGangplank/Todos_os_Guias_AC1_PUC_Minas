// -------------------------
// clock2  
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 

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
		#36 clk = ~clk; 
	end 
		endmodule // clock ( ) 
		module clock2; 
		wire clk; 
		clock CLK1 ( clk ); 
initial begin 
		$dumpfile ( "clock2.vcd" ); 
		$dumpvars; 
	#120 $finish; 
end 
endmodule // clock2 ( ) 