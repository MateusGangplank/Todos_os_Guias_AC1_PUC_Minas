//Wadson Ferreira
//460631

`include "MEM14.v"

module MEM18(output[7:0] saida, input[7:0] entrada, input addr, input rw, input clock, input clear);
	reg clockInterno=0;
	reg[7:0] saida;
	reg[3:0] entrada0, entrada1;
	wire[3:0] saida0, saida1;
	MEM14 M1(saida0,entrada0,addr,rw,clockInterno,clear);
	MEM14 M2(saida1,entrada1,addr,rw,clockInterno,clear);
	always @(posedge clock) begin
		entrada1[3]=entrada[7];
		entrada1[2]=entrada[6];
		entrada1[1]=entrada[5];
		entrada1[0]=entrada[4];
		entrada0[3]=entrada[3];
		entrada0[2]=entrada[2];
		entrada0[1]=entrada[1];
		entrada0[0]=entrada[0];
		if(rw) clockInterno=1;
	end
	always @(negedge clock) begin
		saida[7]=saida1[3];
		saida[6]=saida1[2];
		saida[5]=saida1[1];
		saida[4]=saida1[0];
		saida[3]=saida0[3];
		saida[2]=saida0[2];
		saida[1]=saida0[1];
		saida[0]=saida0[0];
		clockInterno=0;
	end
endmodule
