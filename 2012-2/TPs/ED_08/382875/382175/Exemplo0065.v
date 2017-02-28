//-------------------------------------
// Exemplo0065
// Nome: Oswaldo Oliveira Paulino 
// Matricula: 382175
// ------------------------- 

`include "FFs.v"

module paraleloSerie(input [4:0]data, input clk,
							input ld, input clear);
	wire [4:0]d;
	wire q1,q2,q3,q4,q5;
	wire qnot1,qnot2,qnot3,qnot4,qnot5;
	
	and and0(d[0],ld,data[0]);
	and and1(d[1],ld,data[1]);
	and and2(d[2],ld,data[2]);
	and and3(d[3],ld,data[3]);
	and and4(d[4],ld,data[4]);
	
	dff2 flip1(q1,qnot1,0,clk,d[4],clear);
	dff2 flip2(q2,qnot2,q1,clk,d[3],clear);
	dff2 flip3(q3,qnot3,q2,clk,d[2],clear);
	dff2 flip4(q4,qnot4,q3,clk,d[1],clear);
	dff2 flip5(q5,qnot5,q4,clk,d[0],clear);
	
	always @(posedge clk)
		begin
			$display("%d %b %b %b %b %b", $time, q1,q2,q3,q4,q5);
		end

endmodule //paraleloSerie

module principal;
	reg[4:0] data;
	reg clear,ld;
	wire clk;
	
	clock clk1(clk);
	paraleloSerie piso(data,clk,ld,clear);
	
	initial begin
		$display("\t\t   D a b c d e");
		clear = 0; 
		ld = 0;
		data = 5'b11010;
		#1 clear = 1;
		#1 clear = 0;
		#1 ld = 1;
		#1 ld = 0;
		#44 data = 5'b11100;
		#3 ld = 1;
		#1 ld = 0;
		#60 $finish;
	end
	
endmodule //principal

/*
	  D a b c d e
     5 1 1 0 1 0
    15 0 1 1 0 1
    25 0 0 1 1 0
    35 0 0 0 1 1
    45 0 0 0 0 1
    55 1 1 1 0 0
    65 0 1 1 1 0
    75 0 0 1 1 1
    85 0 0 0 1 1
    95 0 0 0 0 1
   105 0 0 0 0 0
*/