//------------------------------------------------------
//Exercicio0093 - contador decádico 5 bits decrescente
//Nome: Guilherme Diniz de Assumpcao
//Matrícula: 462269
//------------------------------------------------------

`include "flipflops.v"

module decadeCounter5bits(output [4:0]s, input signal, input pulse,input clear);
	wire [4:0]q;
	wire [4:0]qnot;
	wire w1,w2,w3;
	
	not not1(w1,signal);
	
	and and1(w2,q[0],qnot[1],q[2],qnot[3],q[4]);
	
	or or1(w3,w1,w2);
	
	jkff flip1(q[0],qnot[0],signal,signal,pulse,w3,clear);
	jkff flip2(q[1],qnot[1],signal,signal,q[0],w3,clear);
	jkff flip3(q[2],qnot[2],signal,signal,q[1],w3,clear);
	jkff flip4(q[3],qnot[3],signal,signal,q[2],w3,clear);
	jkff flip5(q[4],qnot[4],signal,signal,q[3],w3,clear);
	
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
		$display("Exercicio0093 - Down Decade Counter (5bits) - Guilherme Diniz de Assumpcao - 462269");
		$display("bin \t- \tdecimal");
		$monitor("%5b \t- \t%d",s,s);
		#1 clear = 1;
		#1 clear = 0;
		#1 sinal = 1;
		
		#310 $finish;
	end
endmodule //principal