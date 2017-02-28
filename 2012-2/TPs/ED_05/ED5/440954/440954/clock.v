// -------------------------
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// -- test clock generator (2)
// -------------------------
module clock(clk);
	output clk;
	reg clk;
	
	initial begin
		clk = 1'b0;
	end
	
	always begin
		#12 clk = ~clk;
	end
		
endmodule // clock()