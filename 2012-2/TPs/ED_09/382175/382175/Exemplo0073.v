//-------------------------------------
// Exemplo0073
// Nome: Oswaldo Oliveira Paulino 
// Matricula: 382175
// ------------------------- 

`include "FFs.v"

module decadeCont6bits(output [5:0]s, input signal, input pulse, input [5:0] preset, input clear);
	wire [5:0]q;
	wire [5:0]qnot;
	wire w1,w2;
	
	nand NAND1(w1,qnot[0],q[1],qnot[2],q[3],qnot[4],qnot[5]);
	nand NAND2(w2,w1,clear);
	
	jkff flip1(q[0],qnot[0],signal,signal,pulse,preset[0],w2);
	jkff flip2(q[1],qnot[1],signal,signal,qnot[0],preset[1],w2);
	jkff flip3(q[2],qnot[2],signal,signal,qnot[1],preset[2],w2);
	jkff flip4(q[3],qnot[3],signal,signal,qnot[2],preset[3],w2);
	jkff flip5(q[4],qnot[4],signal,signal,qnot[3],preset[4],w2);
	jkff flip6(q[5],qnot[5],signal,signal,qnot[4],preset[5],w2);
	
	assign s = q;
	
endmodule //decadeCont6bits

module principal;
	reg signal,clear;
	reg [5:0] preset;
	wire pulse;
	wire [5:0]s;
	
	clock clk(pulse);
	
	decadeCont6bits dc1(s,signal,pulse,preset,clear);
	
	initial begin
		signal = 0;
		clear = 0;
		$display("  s");
		$monitor("%5b",s);
		#1 clear = 1;
		#1 signal = 1;
		
		#200 $finish;
	end
endmodule //principal

/*
      s
    000000
    000001
    000010
    000011
    000100
    000101
    000110
    000111
    001000
    001001
    000000
    000001
    000010
    000011
    000100
    000101
    000110
    000111
    001000
    001001
    000000
*/