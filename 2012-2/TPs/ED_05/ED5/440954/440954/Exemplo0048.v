// -------------------------
// Exemplo0048
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// -- test clock generator (8)
// -------------------------

module clock(clk);
	output clk;
	reg clk;
	
	initial begin
		clk = 1'b0;
	end
	
	always begin
		#15 clk = ~clk;
	end
		
endmodule // clock()

module pulse(signal, clock);
	input clock;
	output signal;
	reg signal;
	
	always @ (clock)
	begin
		   signal = 1'b1;
		#5 signal = 1'b0;
		#5 signal = 1'b1;
		#5 signal = 1'b0;
	end
endmodule // pulse

module Exemplo0048;
	wire clock;
	clock clk(clock);
	wire p1;
		
	pulse pls1(p1, clock);
	
	initial begin
		$dumpfile("Exemplo0048.vcd");
		$dumpvars(1, clock, p1);
		
		#480 $finish;
	end
endmodule // Exemplo0048