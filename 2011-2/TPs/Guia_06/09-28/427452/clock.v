// ---------------------------
// -- clock
// ---------------------------
module clockExe ( clk );
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

endmodule // clockExe ( )



module clock;
	wire clk;
	clockExe CLK1 ( clk );
	
	initial begin
		$dumpfile ( "clock.vcd" );
		$dumpvars;
		#120 $finish;
	end
endmodule // clock ( )