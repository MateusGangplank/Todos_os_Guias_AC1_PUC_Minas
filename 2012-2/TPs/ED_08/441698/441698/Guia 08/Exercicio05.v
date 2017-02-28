// -------------------------
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

`include "clock.v" 
`include "dff.v"
 
// -----------------------------------------------------------
// --  parallel In Serial Out, para 5 bits
// -----------------------------------------------------------
module parallelInSerialOut(input[4:0] data, input clk, input load, input clear);
	wire[4:0] d;
	wire q1,q2,q3,q4,q5;
	wire qnot1,qnot2,qnot3,qnot4,qnot5;
	
	and and0(d[0],load,data[0]);
	and and1(d[1],load,data[1]);
	and and2(d[2],load,data[2]);
	and and3(d[3],load,data[3]);
	and and4(d[4],load,data[4]);
	
	dff2 flip1(q1,qnot1,0,clk,d[4],clear);
	dff2 flip2(q2,qnot2,q1,clk,d[3],clear);
	dff2 flip3(q3,qnot3,q2,clk,d[2],clear);
	dff2 flip4(q4,qnot4,q3,clk,d[1],clear);
	dff2 flip5(q5,qnot5,q4,clk,d[0],clear);
	
	always @(posedge clk)
		begin
			$display("%d %b %b %b %b %b",$time,q1,q2,q3,q4,q5);
		end

endmodule

// -------------------------
// -- Teste
// -------------------------
module teste;
	reg[4:0] data;
	reg clear,load;
	wire clk;
	
	clock clk1(clk);
	parallelInSerialOut p(data,clk,load,clear);

	
	initial begin
		$display("\t\t   t a b c d");
		#1 clear = 1;
		#1 clear = 0;
		#1 load = 1;
		#1 load = 0;
		#44 data = 5'b10110;
		#3 load = 1;
		#1 load = 0;
		#60 $finish;
	end
endmodule //teste