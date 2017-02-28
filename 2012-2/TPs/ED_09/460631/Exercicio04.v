//Wadson Ferreira
//460631

`include "jkff3.v"

module contador(output[5:0] saida, input clock);
	reg preset;	
	wire reset1, reset0;
	jkff F5(saida[0],qnot,1,1,clock,0,preset);
	jkff F4(saida[1],reset1,1,1,saida[0],0,preset);
	jkff F3(saida[2],qnot,1,1,saida[1],0,preset);
	jkff F2(saida[3],reset0,1,1,saida[2],0,preset);
	jkff F1(saida[4],qnot,1,1,saida[3],0,preset);
	jkff F0(saida[5],qnot,1,1,saida[4],0,preset);
	always @(posedge clock) begin
		if(saida[0] & reset1 & saida[2] & reset0 & saida[4] & saida[5]) begin
			preset=1;
		end else begin
			preset=0;
		end
	end
endmodule

module exercicio04;
	reg clock;
	wire[5:0] saida;
	contador C(saida, clock);
	initial begin
		clock = 1;
		#320 $finish;
	end
	always begin #5 clock=~clock; end
	always @(posedge clock) begin $display("%d %6b",$time,saida); end
endmodule
