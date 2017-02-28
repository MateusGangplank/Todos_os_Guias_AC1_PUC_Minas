//-------------------------------------
// --Nome: Milton costa teles da silva
// --Matricula: 002751
//-- Exercicio 01 - Guia 08
//-------------------------------------

`include "flipflop.v"

module leftShiftRegister(data, clk);
	input data, clk;
	wire q1,q2,q3,q4;
	wire qnot1,qnot2,qnot3,qnot4;
	dff flip1(q1,qnot1,data,clk);
	dff flip2(q2,qnot2,q1,clk);
	dff flip3(q3,qnot3,q2,clk);
	dff flip4(q4,qnot4,q3,clk);
	
	always @(posedge clk)
		begin
			$display("%d %b %b %b %b", $time, q4,q3,q2,q1);
		end
endmodule //leftShiftRegister

module principal;
	reg data;
	wire clk;
	
	clock clk1(clk);
	leftShiftRegister lsr(data,clk);
	   
		initial begin
		$display("Exercicio01-Nome: Milton costa teles da silva-Matricula: 002751");
		$display("Left Shift Register");
		$display("\t\t   t a b c d");
		data = 0;  
		#5 data = 1;
		#10 data = 0;
		#20 data = 1;
		#10 data = 0;
		#10 data = 1;
		#50 $finish;
	end
endmodule //principal