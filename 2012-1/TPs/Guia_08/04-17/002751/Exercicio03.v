//-------------------------------------
// --Nome: Milton costa teles da silva
// --Matricula: 002751
//-- Exercicio 03 - Guia 08
//-------------------------------------
`include "flipflop.v"

module rightShiftRegister(input data,input clk,
	               input[3:0]preset,input clear);
	wire w0,q1,q2,q3,q4;
	wire qnot1,qnot2,qnot3,qnot4;
	or or1(w0,q4,d);
	dff2 flip1(q1,qnot1,w0,clk,preset[0],clear);
	dff2 flip2(q2,qnot2,q1,clk,preset[1],clear);
	dff2 flip3(q3,qnot3,q2,clk,preset[2],clear);
	dff2 flip4(q4,qnot4,q3,clk,preset[3],clear);
	
	always @(posedge clk)
		begin
			$display("%d %b %b %b %b", $time, q1,q2,q3,q4);
		end
endmodule //rightShiftRegister

module principal;
	reg d,clear;
	reg [3:0]preset;
	wire clk;
	
	clock clk1(clk);
	rightShiftRegister rsr(d,clk,preset,clear);
	
	initial begin
		$display("Exercicio03-Nome: Milton costa teles da silva-Matricula: 002751");
		$display("Left Shift Register");
		$display("\t\t   t a b c d");
		d = 1;
		#10 d = 0;
		#10 d = 1;
		#20 d = 0;
		#10 d = 1;
		#30 $finish;
	end
endmodule //principal