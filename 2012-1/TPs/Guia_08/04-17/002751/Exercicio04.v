//-------------------------------------
// --Nome: Milton costa teles da silva
// --Matricula: 002751
//-- Exercicio 04 - Guia 08
//-------------------------------------

`include "flipflop.v"

module leftShiftRegister(data, clk);
	input data, clk;
	wire w0,q1,q2,q3,q4;
	wire qnot1,qnot2,qnot3,qnot4;
	or or1(w0,qnot1,data);
	dff2 flip1(q1,qnot1,q2,clk,preset[0],clear);
	dff2 flip2(q2,qnot2,q3,clk,preset[1],clear);
	dff2 flip3(q3,qnot3,q4,clk,preset[2],clear);
	dff2 flip4(q4,qnot4,w0,clk,data,q1);
	
	always @(posedge clk)
		begin
			$display("%d %b %b %b %b",$time,q4,q3,q2,q1);
		end
endmodule //leftShiftRegister

module principal;
	reg d;
	wire clk;
	
	clock clk1(clk);
	leftShiftRegister lsr(d,clk);
	
	initial begin
	   $display("Exercicio02-Nome: Milton costa teles da silva-Matricula: 002751");
		$display("Left Shift Register");
		$display("\t\t   t a b c d");
		d = 0;
		#14 d = 1;
		#10 d = 0;
		#20 d = 1;
		#10 d = 0;
		#20 d = 1;
		#20 $finish;
	end
	
endmodule //principal