// ----------------------------------------------------
// -- Alexandre Palmieri Sad
// -- 440265
// -- Exercicio004
// ----------------------------------------------------
`include "flipflopJK.v"

// ----------------------------------------------------
// -- CONTADOR DECADICO DECRESCENTE DE 5 BITS
// ----------------------------------------------------
module CDD5B(s, sinal, CLK, CLR);
	output [4:0]s;
	input sinal;
	input CLK;
	input CLR;
	
	wire 	[4:0]q;
	wire 	[4:0]qnot;
	wire 	w1, w2;
		
	nand G(w1,qnot[0],q[1],qnot[2],q[3],qnot[4]);
	nand F(w2, CLR, w1);
	
	jkff A(q[0],qnot[0],sinal, sinal,CLK, 0, w2);
	jkff B(q[1],qnot[1],sinal, sinal,qnot[0], 0, w2);
	jkff C(q[2],qnot[2],sinal, sinal,qnot[1], 0, w2);
	jkff D(q[3],qnot[3],sinal, sinal,qnot[2], 0, w2);
	jkff E(q[4],qnot[4],sinal, sinal,qnot[3], 0, w2);
	
	assign s = q;

endmodule

module principal;
	reg  CLR, sinal;
	wire CLK;
   wire [4:0]saida;
	
	clock CK (CLK);
	
	CDD5B contador(saida, sinal, CLK, CLR);
	
	initial begin
		CLR   = 0;
		sinal = 0;
		$display("---------------------------");
		$display("Alexandre Palmieri Sad");
		$display("440265");
		$display("---------------------------");
		$monitor("%5b ---> %d", saida, saida);	
		#1 CLR   = 1;
		#1 sinal = 1;
		#630 $finish; // -- de 0 a 9	
		$finish;
	end
endmodule