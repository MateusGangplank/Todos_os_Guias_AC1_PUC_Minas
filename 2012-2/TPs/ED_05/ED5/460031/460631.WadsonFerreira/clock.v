//modulo clock
//Wadson Ferreira
//460631

module clock(output clk);
	reg clk;
	initial begin
		clk=1'b0;
	end
	always
	begin
		#12 clk = ~clk;
	end
endmodule
