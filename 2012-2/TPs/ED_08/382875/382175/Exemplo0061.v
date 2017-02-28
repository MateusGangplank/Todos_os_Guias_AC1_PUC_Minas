//-------------------------------------
// Exemplo0061
// Nome: Oswaldo Oliveira Paulino 
// Matricula: 382175
// ------------------------- 

`include "FFs.v"

module leftShift(d, clk);
	input d, clk;
	wire q1,q2,q3,q4,q5;
	wire qnot1,qnot2,qnot3,qnot4,qnot5;
	dff flip1(q1,qnot1,d,clk);
	dff flip2(q2,qnot2,q1,clk);
	dff flip3(q3,qnot3,q2,clk);
	dff flip4(q4,qnot4,q3,clk);
	dff flip5(q5,qnot5,q4,clk);
	
	always @(posedge clk)
		begin
			$display("%d %b %b %b %b %b", $time, q5,q4,q3,q2,q1);
		end
endmodule //leftShift

module principal;
	reg d;
	wire clk;
	
	clock clk1(clk);
	leftShift lf1(d,clk);
	
	initial begin
		$display("\t\t   t a b c d e");
		d = 0;
		#5 d = 1;
		#10 d = 0;
		#10 d = 1;
		#20 d = 0;
		#10 d = 1;
		#30 $finish;
	end
endmodule //principal

/*
	  t a b c d e
     5 x x x x x
    15 x x x x 1
    25 x x x 1 0
    35 x x 1 0 1
    45 x 1 0 1 1
    55 1 0 1 1 0
    65 0 1 1 0 1
    75 1 1 0 1 1
    85 1 0 1 1 1
*/