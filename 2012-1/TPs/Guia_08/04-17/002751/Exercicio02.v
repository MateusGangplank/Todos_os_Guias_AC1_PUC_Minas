//-------------------------------------
// --Nome: Milton costa teles da silva
// --Matricula: 002751
//-- Exercicio 02 - Guia 08
//-------------------------------------

`include "flipflop.v"

module leftShiftRegister(data, clk);
	input data, clk;
	wire w0,w1,w2,q1,q2,q3,q4;
	wire qnot1,qnot2,qnot3,qnot4;
	or or1(w0,d,q2);
	or or2(w1,d,q3);
	or or3(w2,d,q4);
	dff2 flip1(q1,qnot1,w0,data,q2,clk);
	dff2 flip2(q2,qnot2,w1,data,q3,clk);
	dff2 flip3(q3,qnot3,w2,data,q4,clk);
	dff2 flip4(q4,qnot4,preset,clear,data,clk);
	
	always @(posedge clk)
		begin
			$display("%d %b %b %b %b",$time,q4,q3,q2,q1);
		end
endmodule //leftShiftRegister

module principal;
	reg d;
	wire clk;
	
	clock clk1(clk);
	leftShiftRegister lf1(d,clk);
	
	initial begin
	   $display("Exercicio02-Nome: Milton costa teles da silva-Matricula: 002751");
		$display("Left Shift Register");
		$display("\t\t   t a b c d");
		d = 0;
		#12 d = 1;
		#10 d = 0;
		#20 d = 1;
		#20 $finish;
	end
endmodule //principal