// RAM 1X8
// Nome: Átila Martins Silva Júnior
// Matricula: 449014

`include"ram1x4.v"

module ram1x8(output[7:0] s, input[7:0] in0, input addr, input rw, input clk);
	ram1x4 RAM1X4_0(s[7:4], in0[7:4], clk, rw, addr);
	ram1x4 RAM1X4_1(s[3:0], in0[3:0], clk, rw, addr);
endmodule
