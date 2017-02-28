// ----------------------------------------------------
// -- Alexandre Palmieri Sad
// -- 440265
// -- Exercicio003
// ----------------------------------------------------

`include "clock.v"
`include "flipflopJK.v"

// ----------------------------------------------------
// -- CONTADOR DECADICO DECRESCENTE DE 5 BITS
// ----------------------------------------------------
module CDD5B(saida, CLK, data, CLR);
	output [4:0]saida;
	input  CLK;
	input  data;
	input  CLR;
	
	wire pst;
	wire q[4:0];
	wire qnot[4:0];
	wire n[3:0];
	wire g;
	
	not  N0(n0, data);
	or   F (pst, n0, g);
	jkff A(saida[0], qnot[0], data, data, CLK, pst, CLR);
	jkff B(saida[1], qnot[1], data, data, saida[0], pst, CLR);
	jkff C(saida[2], qnot[2], data, data, saida[1], pst, CLR);
	jkff D(saida[3], qnot[3], data, data, saida[2], pst, CLR);
	jkff E(saida[4], qnot[4], data, data, saida[3], pst, CLR);
	
	
	not  N1(n1, qnot[0]);
	not  N2(n2, qnot[2]);
	not  N3(n3, qnot[4]);
	and  G (g, n1, qnot[1], n2, qnot[3], n3);

endmodule

module principal;
	reg  CLR;
	reg  data;
	wire CLK;
   wire [4:0]saida;
	
	clock CK (CLK);
	
	CDD5B contador(saida, CLK, data, CLR);
	
	initial begin:start
		#1 CLR = 0;
		#1 data = 0;
	end
	
	initial begin
		$display("---------------------------");
		$display("Alexandre Palmieri Sad");
		$display("440265");
		$display("---------------------------");
		$monitor("%5b ---> %d", saida, saida);	
		#1 CLR = 1;
		#1 CLR = 0;
		#1 data = 1;
		#630 $finish; // -- de 0 a 31	
		$finish;
	end
endmodule