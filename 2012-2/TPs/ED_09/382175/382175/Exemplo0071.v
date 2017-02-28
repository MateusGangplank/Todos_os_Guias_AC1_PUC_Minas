//-------------------------------------
// Exemplo0071
// Nome: Oswaldo Oliveira Paulino 
// Matricula: 382175
// ------------------------- 

`include "FFs.v"

module decCont5bits(output [4:0]s, input signal,
						  input pulse,input [4:0]preset,input clear);
	wire [4:0]q;
	wire [4:0]qnot;
	wire [4:0]s;
	
	jkff flip5(q[4],qnot[4],signal,signal,pulse,preset[4],clear);
	jkff flip4(q[3],qnot[3],signal,signal,qnot[4],preset[3],clear);
	jkff flip3(q[2],qnot[2],signal,signal,qnot[3],preset[2],clear);
	jkff flip2(q[1],qnot[1],signal,signal,qnot[2],preset[1],clear);
	jkff flip1(q[0],qnot[0],signal,signal,qnot[1],preset[0],clear);
	
	assign s[0] = qnot[4];
	assign s[1] = qnot[3];
	assign s[2] = qnot[2];
	assign s[3] = qnot[1];
	assign s[4] = qnot[0];
endmodule //decCont5bits

module principal;
	wire [4:0]s;
	wire pulse;
	reg [4:0] preset;
	reg signal,clear;
	
	clock clk(pulse);
	
	decCont5bits c1(s,signal,pulse,preset,clear);
	
	initial begin
		preset = 0;
		clear = 0;
		signal = 0;
		
		$display("  s");
		$monitor("%5b",s);
		#1 clear = 1;
		#1 clear = 0;
		#1 signal = 1;
		
		#310 $finish;
	end
endmodule //principal

/*
      s
    xxxxx
    11111
    11110
    11101
    11100
    11011
    11010
    11001
    11000
    10111
    10110
    10101
    10100
    10011
    10010
    10001
    10000
    01111
    01110
    01101
    01100
    01011
    01010
    01001
    01000
    00111
    00110
    00101
    00100
    00011
    00010
    00001
    00000
*/