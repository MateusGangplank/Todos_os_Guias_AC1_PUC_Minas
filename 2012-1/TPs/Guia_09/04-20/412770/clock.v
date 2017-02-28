//-------------------------------------
// Clock
// Nome: Rayan Darwin
// Matrícula: 412770
//-------------------------------------



module clock(clk);
	output clk;
	reg clk;
	
	initial begin
		clk = 1'b0;
	end
	
	always
		begin
			#5 clk = ~clk;
		end
endmodule //-- clock