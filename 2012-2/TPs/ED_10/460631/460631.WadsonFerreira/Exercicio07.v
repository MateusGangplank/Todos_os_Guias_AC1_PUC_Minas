//Wadson Ferreira
//460631

`include "MEM18.v"

module mux(output[3:0] saida, input[1:0] entrada);
	wire[3:0] saida;
	and A1(saida[0],~entrada[1],~entrada[0]);
	and A2(saida[1],~entrada[1],entrada[0]);
	and A3(saida[2],entrada[1],~entrada[0]);
	and A4(saida[3],entrada[1],entrada[0]);
endmodule

module demux(output[7:0] saida, input[1:0] selection, input[7:0] e3, input[7:0] e2, input[7:0] e1, input[7:0] e0);
	reg[7:0] saida;
	always #10 begin
		if(~selection[1] & ~selection[0]) begin
			saida<=e0; end
		else if(~selection[1] & selection[0]) begin
			saida<=e1; end
		else if(selection[1] & ~selection[0]) begin
			saida<=e2; end
		else begin
			saida<=e3; end
	end
endmodule

module MEM48(output[7:0] saida, input[7:0] entrada, input[1:0] addr, input rw, input clock, input clear);
	wire[3:0] saidaMux;
	wire[7:0] e3, e2, e1, e0;
	mux Mu(saidaMux,addr);
	MEM18 M3(e3,entrada,saidaMux[3],rw,clock,0);
	MEM18 M2(e2,entrada,saidaMux[2],rw,clock,0);
	MEM18 M1(e1,entrada,saidaMux[1],rw,clock,0);
	MEM18 M0(e0,entrada,saidaMux[0],rw,clock,0);
	demux Md(saida,addr,e3,e2,e1,e0);
endmodule

module Exercicio07;
	wire[7:0] saida;
	reg[7:0] entrada=8'b00000001;
	reg clock=1, rw=1;
	reg[1:0] addr=00;
	MEM48 M1(saida,entrada,addr,rw,clock,0);
	initial begin
		$display("Tempo Entrada Addr Rw Saida");
		#10 addr=01; rw=1; entrada=8'b00000010;
		#10 addr=10; rw=1; entrada=8'b00000011;
		#10 addr=11; rw=1; entrada=8'b00000100;
		#10 addr=00; rw=1; entrada=8'b00000001;
		#10 rw=0; addr=01;
		#10 addr=10;
		#10 addr=11;
		#10 addr=00;
		#10 $finish;
	end
	always @(posedge clock) begin
		$display("%d %8b %b %b %8b",$time,entrada,addr,rw,saida);
	end
	always #5 clock = ~clock;
endmodule
