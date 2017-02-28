//Wadson Ferreira
//460631


`include "MEM14.v"

//*******SAIDA*******//
// Tempo Addr Rw Clock Saida
// 10 1111 0 1 1 0000
// 20 0001 1 1 1 1111
// 30 0001 0 0 1 0001
// 40 0001 1 0 1 1111
// 50 1001 0 1 1 0001
// 60 1111 1 1 1 1001
// 70 1111 0 0 1 1111
// 80 1111 1 0 1 1001
// 90 1111 1 0 1 1111
//*******************//


module MEM24(output[3:0] saida, input[3:0] entrada, input addr, input rw, input clock, input clear);
	reg clockInterno=0;
	reg[3:0] saida;
	wire[3:0] saida0, saida1;
	MEM14 M1(saida0,entrada,~addr,rw,clockInterno,clear);
	MEM14 M2(saida1,entrada,addr,rw,clockInterno,clear);
	always @(posedge clock) begin
		//muda o clock dos flip-flop quando necessário
		if(rw) clockInterno=1;
	end
	//garante a borda de descida de clockInterno
	always @(negedge clock) begin
		clockInterno=0;
		if(addr) begin saida=saida1; end else begin saida=saida0; end 
	end
endmodule

module teste2;
	wire[3:0] saida;
	reg[3:0] entrada=4'b1111;
	reg addr=0, rw=0, clock=1, clear=0;
	MEM24 M(saida,entrada,addr,rw,clock,clear);
	initial begin
		$display("Tempo Entrada Addr Rw Clock Saida");
		//armazena 1111 na posição 0
		#10 rw=1; addr=0;
		//armazena 0001 na posição 1
		#10 entrada=4'b0001; addr=1;
		//mostra a posição 0
		#10 addr=0; rw=0;
		//mostra a posição 1
		#10 addr=1;
		//altera a posição 0
		#10 addr=0; entrada=4'b1001; rw=1;
		//altera a posição 1
		#10 addr=1; entrada=4'b1111;
		//mostra a posição 0
		#10 addr=0; rw=0;
		//mostra a posição 1
		#10 addr=1;
		#10 $finish;
	end
	always @(posedge clock) begin
		$display("%d %4b %b %b %b %4b",$time,entrada,addr,rw,clock,saida);
	end
	always begin #5 clock = ~clock; end
endmodule
