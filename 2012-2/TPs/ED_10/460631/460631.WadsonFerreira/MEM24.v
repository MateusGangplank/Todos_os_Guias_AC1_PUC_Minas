//Wadson Ferreira
//460631

`include "MEM14.v"

module MEM24(output[3:0] saida, input[3:0] entrada, input addr, input rw, input clock, input clear);
	reg clockInterno=0;
	reg[3:0] saida;
	wire[3:0] saida0, saida1;
	MEM14 M1(saida0,entrada,~addr,rw,clockInterno,clear);
	MEM14 M2(saida1,entrada,addr,rw,clockInterno,clear);
	always @(posedge clock) begin
		//muda o clock dos flip-flop quando necessário
		if(rw) begin clockInterno=1; saida=8'bxxxxxxxx; end
	end
	//garante a borda de descida de clockInterno
	always @(negedge clock) begin
		clockInterno=0;
		if(~rw & addr) begin saida=saida1; end else begin saida=saida0; end 
	end
endmodule
