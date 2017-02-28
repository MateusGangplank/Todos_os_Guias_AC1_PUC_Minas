//------------------------------------------------------
//Exercicio0087 - Right Shift Register com anel torcido
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
//------------------------------------------------------

`include "flipflops.v"

module rightShift(input d, input clk,
	input[3:0] preset, input clear);
	wire w0,q1,q2,q3,q4;
	wire qnot1,qnot2,qnot3,qnot4;
	or or1(w0,q4not,d);
	dff2 flip1(q1,qnot1,w0,clk,preset[0],clear);
	dff2 flip2(q2,qnot2,q1,clk,preset[1],clear);
	dff2 flip3(q3,qnot3,q2,clk,preset[2],clear);
	dff2 flip4(q4,qnot4,q3,clk,preset[3],clear);
	
	always @(posedge clk)
		begin
			$display("%d %b %b %b %b",$time,q1,q2,q3,q1);
		end
endmodule //rightShift

module principal;
	reg d, clear;
	reg [3:0] preset;
	wire clk;
	
	clock clk1(clk);
	rightShift rs1(d,clk,preset, clear);
	
	initial begin
		$display("Exercicio0087 - Right Shift Register circular com anel torcido");
		$display("Mateus Guilherme do Carmo Cruz - 427446");
		$display("\t\t   t a b c d");
		clear = 1;
		preset = 0;
		d = 0;
		#1 clear = 0;
		#1 preset = 4'b1111;
		#1 preset = 4'b0000;
		#12 d = 1;
		#10 d = 0;
		#20 d = 1;
		#20 $finish;
	end
	
endmodule //principal