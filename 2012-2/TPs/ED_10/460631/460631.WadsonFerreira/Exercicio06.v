//Wadson Ferreira
//460631

`include "MEM18.v"

module MEM116(output[15:0] saida, input[15:0] entrada, input addr, input rw, input clock, input clear);
	reg clockInterno=0;
	MEM18 M1(saida[15:8],entrada[15:8],addr,rw,clockInterno,0);
	MEM18 M2(saida[7:0],entrada[7:0],addr,rw,clockInterno,0);
	always @(posedge clock) begin
		if(addr & rw) begin clockInterno=1; end
	end
	always @(negedge clock) begin
		clockInterno=0;
	end
endmodule

module Exercicio06;
	wire[15:0] saida;
	reg[15:0] entrada;
	reg clock=1, rw=0, addr=0;
	MEM116 M1(saida,entrada,addr,rw,clock,0);
	initial begin
		$display("Tempo Entrada Addr Rw Saida");
		#10 addr=1; rw=1; entrada=16'b1111111100000011;
		#10 rw=0;
		#20 rw=1; entrada=16'b1111111111111111;
		#10 $finish;
	end
	always @(posedge clock) begin
		$display("%d %16b %b %b %16b",$time,entrada,addr,rw,saida);
	end
	always #5 clock = ~clock;
endmodule
