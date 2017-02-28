//Wadson Ferreira
//460631

`include "jkff.v"

module contador(output[4:0] saida, input clock, input reset);
	wire clock1, clock2, clock3, clock4;
	jkff JK4(algo,saida[4],1,1,clock4);
	jkff JK3(clock4,saida[3],1,1,clock3);
	jkff JK2(clock3,saida[2],1,1,clock2);
	jkff JK1(clock2,saida[1],1,1,clock1);
	jkff JK0(clock1,saida[0],1,1,clock);
endmodule

module exercicio;
	reg clock;
	wire[4:0] saida;
	contador C(saida, clock, 0);
	initial begin
		clock = 1;
		#320 $finish;
	end
	always begin #5 clock=~clock; end
	always @(posedge clock) begin $display("%d %5b",$time,saida); end
endmodule
