// Exercicio 003 – RAM 1X8
// Nome: Átila Martins Silva Júnior
// Matricula: 449014

`include"ram1x4.v"

module ram1x8(output[7:0] s, input[7:0] in0, input addr, input rw, input clk);
	ram1x4 RAM1X4_0(s[7:4], in0[7:4], clk, rw, addr);
	ram1x4 RAM1X4_1(s[3:0], in0[3:0], clk, rw, addr);
endmodule

module testRam1x8;
	wire[7:0] s;
	reg[7:0] in0;
	reg addr, rw, clk;
	
	ram1x8 RAM1X8(s, in0, addr, rw, clk);
	
	initial begin
	$display("Exercicio03 - Átila Martins Silva Júnior - 449014");
	
	in0 = 8'b00000000;  addr = 1; rw = 1; clk = 0;
	
	$monitor("input: %b output: %b",in0,s);
	#4in0 = 8'b10101010;
	#4clk = 1;
	#4clk = 0;
	end
endmodule
