// Exercicio 006 – RAM 1X16
// Nome: Átila Martins Silva Júnior
// Matricula: 449014

`include"ram1x8.v"

module ram1x16(output[15:0] s, input addr, input rw, input clk, input[15:0] ent);
	ram1x8 RAM1X8_0(s[15:8], ent[15:8], addr, rw, clk);
	ram1x8 RAM1X8_1(s[7:0], ent[7:0], addr, rw, clk);
endmodule

module testRam1x16;
	wire[15:0] s;
	reg[15:0] ent;
	reg addr, rw, clk;
	
	ram1x16 RAM1X16(s, addr, rw, clk, ent);
	
	initial begin
	$display("Exercicio06 - Átila Martins Silva Júnior - 449014");
	
	ent = 16'b0000000000000000; addr = 1; rw = 1; clk = 0;
	
	$monitor("input: %b output: %b", ent, s);
	#4ent = 16'b1010101010101010; clk = 1;
	#4clk = 0;
	end
endmodule