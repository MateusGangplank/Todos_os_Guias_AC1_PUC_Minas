// -------------------------
// clock1 - 
// Nome: Fl�vio Andrade Amaral Motta
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
		module clock1; 
		wire clk; 
		clock CLK1 ( clk ); 
initial begin 
		$display ("Flavio Andrade Amaral Motta");
		$dumpfile ( "clock1.vcd" ); 
		$dumpvars; 
	#120 $finish; 
end 
endmodule // clock1( ) 