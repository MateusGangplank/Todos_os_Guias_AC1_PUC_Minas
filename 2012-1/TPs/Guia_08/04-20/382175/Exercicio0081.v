//-------------------------------------
// Exercicio0081
// Nome: Oswaldo Oliveira Paulino 
// Matricula: 382175
// ------------------------- 

`include "flipflops.v"

module leftShift(d, clk);
	input d, clk;
	wire q1,q2,q3,q4;
	wire qnot1,qnot2,qnot3,qnot4;
	dff flip1(q1,qnot1,d,clk);
	dff flip2(q2,qnot2,q1,clk);
	dff flip3(q3,qnot3,q2,clk);
	dff flip4(q4,qnot4,q3,clk);
	
	always @(posedge clk)
		begin
			$display("%d %b %b %b %b", $time, q4,q3,q2,q1);
		end
endmodule //leftShift

module principal;
	reg d;
	wire clk;
	
	clock clk1(clk);
	leftShift lf1(d,clk);
	
	initial begin
		$display("\t\t   t a b c d");
		d = 0;
		#5 d = 1;
		#10 d = 0;
		#10 d = 1;
		#20 d = 0;
		#10 d = 1;
		#30 $finish;
	end
endmodule //principal