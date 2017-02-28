//------------------------------------------------
//Exercicio005
//Nome: Pedro Henrique Hardeman Guedes
//Matrícula: 397260
//------------------------------------------------

`include "flipflops.v"

module base8counter(output [3:0]s,input pulse, input clear);
	wire [3:0]q;
	wire [3:0]qnot;
	wire w1,w2;
	
	and and1(w1,q[0],qnot[1],qnot[2],qnot[3]);
	or or1(w2,w1,clear);
	
	tff t4(q[3],qnot[3],pulse,pulse,0,w2);
	tff t3(q[2],qnot[2],qnot[3],qnot[3],0,w2);
	tff t2(q[1],qnot[1],qnot[2],qnot[2],0,w2);
	tff t1(q[0],qnot[0],qnot[1],qnot[1],0,w2);
	
	assign s[0] = q[3];
	assign s[1] = q[2];
	assign s[2] = q[1];
	assign s[3] = q[0];
endmodule //base8counter

module principal;
	reg clear;
	wire [3:0]saida;
	wire pulse;
	
	clock clk(pulse);
	
	base8counter bc(saida,pulse,clear);
	
	initial begin
		clear = 0;
		$display("Exercicio0005 - base 8 counter - João Henrique - 392734");
		$display("bin \t- \tdecimal");
		$monitor("%4b \t- \t%d",saida,saida);
		#1 clear = 1;
		#1 clear = 0;
		#318 $finish;
	end
endmodule //principal