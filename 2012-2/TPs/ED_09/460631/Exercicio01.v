//Wadson Ferreira
//460631

`include "jkff.v"

module contador(output[4:0] saida, input clock, input reset);
	jkff JK4(algo,saida[4],1,1,saida[3]);
	jkff JK3(algo,saida[3],1,1,saida[2]);
	jkff JK2(algo,saida[2],1,1,saida[1]);
	jkff JK1(algo,saida[1],1,1,saida[0]);
	jkff JK0(algo,saida[0],1,1,clock);
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
