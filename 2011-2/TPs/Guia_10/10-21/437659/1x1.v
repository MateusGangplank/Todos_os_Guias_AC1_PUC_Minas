`include "FFJK.V"
module  mem_1por1 (input entrada, input clk, input addr, input clear, output saida, output q, output qnot);

	and and0(clk_s, clk, rw, addr);
	jkff jk1 (q, qnot, entrada, entrada,clk_s);
	and and1(saida, q, addr);

endmodule