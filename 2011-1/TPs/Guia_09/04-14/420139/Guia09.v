module clock(clk);
	output clk;
	reg clk;

	initial begin
		clk = 1'b0;
	end

	always begin
		#60 clk = ~clk;
	end

endmodule

module Exercicio01(s);
	output s;
	reg s;

	initial begin
		s = 1'b0;
	end

	always begin
		#30 s = ~s;
	end

endmodule


module metadeFrequencia(s);
	output s;
	reg s;
	wire clk;

	initial begin
		s = 1'b0;
	end

	clock CLK1(clk);

	always @(posedge clk) begin
		s = ~s;
	end

endmodule

module Exercicio02(s);
	output s;
	reg s;
	wire clk;

	initial begin
		s = 1'b0;
	end

	metadeFrequencia CLK1(clk);

	always @(posedge clk) begin
		s = ~s;
	end

endmodule


module Exercicio03(s);
	output s;
	reg s;
	wire clk;

	initial begin
		s = 1'b0;
	end

	clock CLK1(clk);

	always @clk begin
		s = 1'b1;
		#6 s = 1'b0;
	end

endmodule


module Exercicio04(s);
	output s;
	reg s;

	initial begin
		s = 1'b0;
	end

	always begin
 		s = ~s;
		#480 s = ~s;
		#120;
	end

endmodule


module Exercicio05(s);
	output s;
	reg s;

	initial begin
		s = 1'b0;
	end

	always begin
 		#60 s = ~s;
		#15 s = ~s;
		#45;
	end

endmodule


module test;
	wire clk, s1, s2, s3, s4, s5;

	clock CLK1(clk);
	Exercicio01 DOBROCLK(s1);
	Exercicio02 UMQUARTOCLK(s2);
	Exercicio03 PULSO1(s3);
	Exercicio04 PULSO2(s4);
	Exercicio05 PULSO3(s5);

	initial begin
		$dumpfile("Guia09.vcd");
		$dumpvars(1, clk, s1, s2, s3, s4, s5);
		#12000 $finish;
	end

endmodule