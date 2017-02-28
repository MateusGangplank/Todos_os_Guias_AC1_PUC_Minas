//-------------------------------------
// Exercicio0085
// Nome: Oswaldo Oliveira Paulino 
// Matricula: 382175
// ------------------------- 

`include "flipflops.v"

`define zero 0

module parallel_in_serial_out(input [3:0]data, input clk,
		input load, input clear);
	wire [3:0]d;
	wire q1,q2,q3,q4;
	wire qnot1,qnot2,qnot3,qnot4;
	
	and and0(d[0],load,data[0]);
	and and1(d[1],load,data[1]);
	and and0(d[2],load,data[2]);
	and and0(d[3],load,data[3]);
	
	dff2 flip1(q1,qnot1,`zero,clk,d[3],clear);
	dff2 flip2(q2,qnot2,q1,clk,d[2],clear);
	dff2 flip3(q3,qnot3,q2,clk,d[1],clear);
	dff2 flip4(q4,qnot4,q3,clk,d[0],clear);
	
	always @(posedge clk)
		begin
			$display("%d %b %b %b %b",$time,q1,q2,q3,q4);
		end

endmodule //parallel_in_serial_out

module principal;
	reg[3:0] data;
	reg clear,load;
	wire clk;
	
	clock clk1(clk);
	parallel_in_serial_out piso(data,clk,load,clear);
	
	initial begin
		clear = 0; load = 0;
		data = 4'b1101;
		$display("\t\t   d a b c d");
		#1 clear = 1;
		#1 clear = 0;
		#1 load = 1;
		#1 load = 0;
		#44 data = 4'b1110;
		#3 load = 1;
		#1 load = 0;
		#60 $finish;
	end
	
endmodule //principal