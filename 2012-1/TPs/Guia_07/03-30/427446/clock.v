module clock(clk);
	output clk;
	reg clk;
	
	initial begin
		clk = 1'b1;
	end
	always
		begin
			#5 clk = ~clk;
		end
endmodule //clock