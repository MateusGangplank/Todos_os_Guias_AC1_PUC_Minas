//Gerador de clock
//Wadson Ferreira
//460631

module clock(output clk);
	reg clk;
	initial begin
		clk=1'b0;
	end
	always begin
		#12 clk = ~clk;
	end
endmodule

module teste;
	wire clk;
	clock CLK(clk);
	initial begin
		$dumpfile("Exemplo0041.vcd");
		$dumpvars;
		#120 $finish;
	end
endmodule
