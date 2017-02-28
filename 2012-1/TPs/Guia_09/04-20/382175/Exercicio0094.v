//-------------------------------------
// Exercicio0094
// Nome: Oswaldo Oliveira Paulino 
// Matricula: 382175
// ------------------------- 

`include "flipflops.v"

module decadeCounter5bits(output [4:0]s, input signal, input pulse,input clear);
	wire [4:0]q;
	wire [4:0]qnot;
	wire w1,w2;
	
	nand nand1(w1,qnot[0],q[1],qnot[2],q[3],qnot[4]);
	nand nand2(w2,clear,w1);
	
	jkff flip1(q[0],qnot[0],signal,signal,pulse,0,w2);
	jkff flip2(q[1],qnot[1],signal,signal,qnot[0],0,w2);
	jkff flip3(q[2],qnot[2],signal,signal,qnot[1],0,w2);
	jkff flip4(q[3],qnot[3],signal,signal,qnot[2],0,w2);
	jkff flip5(q[4],qnot[4],signal,signal,qnot[3],0,w2);
	
	assign s = q;
	
endmodule //decadeCounter5bits

module principal;
	reg sinal,clear;
	wire pulse;
	wire [4:0]s;
	
	clock clk(pulse);
	
	decadeCounter5bits dc1(s,sinal,pulse,clear);
	
	initial begin
		sinal = 0;
		clear = 0;
		$display("bin \t- \tdecimal");
		$monitor("%5b \t- \t%d",s,s);
		#1 clear = 1;
		#1 sinal = 1;
		
		#310 $finish;
	end
endmodule //principal