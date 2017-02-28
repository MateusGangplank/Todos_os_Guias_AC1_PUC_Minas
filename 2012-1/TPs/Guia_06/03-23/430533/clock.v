// Nome: Roger Rubens Machado
// Matricula: 430533

module clock ( output clk ); 
	reg clk; 
	initial begin 
	clk = 1'b0; 
end 

always 
begin 
	#12 clk = ~clk; 
end 

endmodule // clock 