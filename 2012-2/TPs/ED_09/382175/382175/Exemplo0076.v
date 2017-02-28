//-------------------------------------
// Exemplo0076
// Nome: Oswaldo Oliveira Paulino 
// Matricula: 382175
// ------------------------- 

`include "FFs.v"

module ringCont(output [5:0]s, input signal, input clk, input clear);
	wire [5:0]q;
	wire [5:0]qnot;
	
	wire w1,w2;
	
	or  OR1(w1,q[5],signal);
	not NOT1(w2,w1);
	
	jkff flip1(q[0],qnot[0],w1,w2,clk,0,clear);
	jkff flip2(q[1],qnot[1],q[0],qnot[0],clk,0,clear);
	jkff flip3(q[2],qnot[2],q[1],qnot[1],clk,0,clear);
	jkff flip4(q[3],qnot[3],q[2],qnot[2],clk,0,clear);
	jkff flip5(q[4],qnot[4],q[3],qnot[3],clk,0,clear);
	jkff flip6(q[5],qnot[5],q[4],qnot[4],clk,0,clear);
	
	assign s[0] = q[5];
	assign s[1] = q[4];
	assign s[2] = q[3];
	assign s[3] = q[2];
	assign s[4] = q[1];
	assign s[5] = q[0];
	
endmodule //ringCont

module principal;
	reg clear, signal;
	wire [5:0]s;
	wire clk;
	
	clock clk1(clk);
	
	ringCont rc1(s,signal,clk,clear);
	
	initial begin
		clear = 0;
		signal = 0;
		$display("  s");
		$monitor("%5b",s);
		#1 clear = 1;
		#1 clear = 0;
		#1 signal = 1;
		#3 signal = 0;
		#180 $finish;
	end
endmodule //principal

/*
      s
    xxxxxx
    000000
    100000
    010000
    001000
    000100
    000010
    000001
    100000
    010000
    001000
    000100
    000010
    000001
    100000
    010000
    001000
    000100
    000010
    000001
    100000
*/