//Wadson Ferreira
//460631

`include "jkff.v"

module MEM14(output[3:0] saida, input[3:0] entrada, input addr, input rw, input clock, input clear);
	reg clockInterno=0;
	jkff B3(saida[3], qnot, entrada[3], ~entrada[3], clockInterno); 
	jkff B2(saida[2], qnot, entrada[2], ~entrada[2], clockInterno); 
	jkff B1(saida[1], qnot, entrada[1], ~entrada[1], clockInterno); 
	jkff B0(saida[0], qnot, entrada[0], ~entrada[0], clockInterno); 
	always @(posedge clock) begin
		//muda o clock dos flip-flop quando necessário
		if(addr & rw) clockInterno=1;
	end
	//garante a borda de descida de clockInterno
	always @(negedge clock) begin
		clockInterno=0;
	end
endmodule
