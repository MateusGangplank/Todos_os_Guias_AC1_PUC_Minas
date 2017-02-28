// ----------------------------------------------------
// -- Alexandre Palmieri Sad
// -- 440265
// -- Exercicio002
// ----------------------------------------------------

`include "clock.v"
`include "flipflopJK.v"

// ----------------------------------------------------
// -- CONTADOR ASSINCRONO CRESCENTE DE 5 BITS
// ----------------------------------------------------
module CAC5B(saida, CLK, data, CLR);
	output [4:0]saida;
	input  CLK;
	input  data;
	input  CLR;
	
	wire pst;
	wire q[4:0];
	
	assign pst = 0;
	
	jkff E(q[4], saida[0], data, data, CLK, pst, CLR);
	jkff D(q[3], saida[1], data, data, q[4], pst, CLR);
	jkff C(q[2], saida[2], data, data, q[3], pst, CLR);
	jkff B(q[1], saida[3], data, data, q[2], pst, CLR);
	jkff A(q[0], saida[4], data, data, q[1], pst, CLR);

endmodule

module principal;
	reg  CLR;
	reg  data;
	wire CLK;
   wire [4:0]saida;
	
	clock CK (CLK);
	
	CAC5B contador(saida, CLK, data, CLR);
	
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