//-------------------------------------
// Exercicio02
// ------------------------- 
`include "flipflops.v"
module leftShift(input d, input clk,
					  input[4:0] preset, input clear);
	wire q1,q2,q3,q4,q5;
	wire qnot1,qnot2,qnot3,qnot4,qnot5;
	dff2 flip1(q1,qnot1,d,clk,preset[0],clear);
	dff2 flip2(q2,qnot2,q1,clk,preset[1],clear);
	dff2 flip3(q3,qnot3,q2,clk,preset[2],clear);
	dff2 flip4(q4,qnot4,q3,clk,preset[3],clear);
	dff2 flip5(q5,qnot5,q4,clk,preset[4],clear);
	always @(posedge clk)
		begin
			$display("%d %b %b %b %b %b", $time, q5,q4,q3,q2,q1);
		end
endmodule
module principal;
	reg d, clear;
	reg [4:0] preset;
	wire clk;
	clock clk1(clk);
	leftShift lf1(d,clk,preset,clear);
	initial begin
		$display("\t\t   t a b c d e");
		clear = 1;
		preset = 0;
		d = 0;
		#1 clear = 0;
		#1 preset = 5'b11111;
		#1 preset = 5'b00000;
		#12 d = 1;
		#10 d = 0;
		#20 d = 1;
		#20 $finish;
	end
endmodule