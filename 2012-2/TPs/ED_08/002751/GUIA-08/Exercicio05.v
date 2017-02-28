//-------------------------------------
// --Nome: Milton costa teles da silva
// --Matricula: 002751
//-- Exercicio 05 - Guia 08
//-------------------------------------

`include "flipflops.v"
`define zero 0

module conversor(input [4:0]data, input clk,
		           input load, input clear);
	wire [4:0]d;
	wire q1,q2,q3,q4,q5;
	wire qnot1,qnot2,qnot3,qnot4,qnot5;
	
	and and0(d[0],load,data[0]);
	and and1(d[1],load,data[1]);
	and and2(d[2],load,data[2]);
	and and3(d[3],load,data[3]);
	and and4(d[4],load,data[4]);
	
	dff2 flip1(q1,qnot1,`zero,clk,d[4],clear);
	dff2 flip2(q2,qnot2,q1,clk,d[3],clear);
	dff2 flip3(q3,qnot3,q2,clk,d[2],clear);
	dff2 flip4(q4,qnot4,q3,clk,d[1],clear);
	dff2 flip5(q5,qnot5,q4,clk,d[0],clear);
	
	always @(posedge clk)
		begin
			$display("%d %b %b %b %b %b",$time,q1,q2,q3,q4,q5);
		end
endmodule //conversor

module principal;
	reg[4:0] data;
	reg clear,load;
	wire clk;
	
	clock clk1(clk);
	conversor p(data,clk,load,clear);

	
	initial begin
	   $display("Exercicio05-Nome: Milton costa teles da silva-Matricula: 002751");
		$display("parallel_in_serial_out piso");
		$display("\t\t   t a b c d e");
		#1 clear = 1;
		#1 clear = 0;
		#1 load = 1;
		#1 load = 0;
		#44 data = 5'b11110;
		#3 load = 1;
		#1 load = 0;
		#60 $finish;
	end
	
endmodule //principal