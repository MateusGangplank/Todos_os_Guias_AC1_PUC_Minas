// -------------------------
// clock3  
// Nome: Flavio Andrade Amaral Motta
// Matricula: 392001

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
		module clock3; 
		wire clk; 
		clock CLK1 ( clk ); 
initial begin 
		$display ("Flavio Andrade Amaral Motta");
		$dumpfile ( "clock3.vcd" ); 
		$dumpvars; 
	#120 $finish; 
end 
endmodule // clock3 () 