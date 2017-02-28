// CLOCK
// Nome: Tiago Moreira
// Matricula: 438948
//
// -- modulo Clock
module clock(clk);
	output clk;
	reg clk;
	
	initial
		begin
		clk = 1'b0;
		end
		
	always
		begin
		#4 clk = ~clk;
		end
		
endmodule //clock