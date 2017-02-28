//Wadson Ferreira
//460631

`include "tff.v"

module modulo(output[3:0] saida, input clock3);
	wire clock2, clock1, clock0;
	reg clear=1;
	always @(posedge clock3) begin
		if (clock2 & saida[1] & clock0 & saida[3]) begin
			clear=0;
		end else begin
			clear=1;
		end
	end
	tff F3(saida[0],clock2,clock3,clock3,1,clear);
	tff F2(saida[1],clock1,clock2,clock2,1,clear);
	tff F1(saida[2],clock0,clock1,clock1,1,clear);
	tff F0(saida[3],qnot,clock0,clock0,1,clear);
endmodule

module teste;
	wire[3:0] saida;
	reg clock = 1;
	modulo M(saida,clock);
	initial begin #200 $finish; end
	always begin #5 clock = ~clock; end
	always @(posedge clock) $display("%d %4b", $time, saida);
endmodule
