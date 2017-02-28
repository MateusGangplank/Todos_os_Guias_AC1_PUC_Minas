// ----------------------------------------------------
// -- Alexandre Palmieri Sad
// -- 440265
// -- Exercicio001
// ----------------------------------------------------

`include "clock.v"
`include "flipflopJK.v"

// ----------------------------------------------------
// -- CONTADOR ASSINCRONO DE 5 BITS
// ----------------------------------------------------
module CAD5B(saida, CLK, data, CLR);
	output [4:0]saida;
	input  CLK;
	input  data;
	input  CLR;
	
	wire q;
	assign pst = 0;
	
	jkff E(q, saida[0], data, data, CLK, pst, CLR);
	jkff D(q, saida[1], data, data, saida[0], pst, CLR);
	jkff C(q, saida[2], data, data, saida[1], pst, CLR);
	jkff B(q, saida[3], data, data, saida[2], pst, CLR);
	jkff A(q, saida[4], data, data, saida[3], pst, CLR);

endmodule

module principal;
	reg  data;
	reg  CLR;
	wire CLK;
   wire [4:0]saida;
	
	clock CK (CLK);
	
	CAD5B contador(saida, CLK, data, CLR);
	
	initial begin:start
		#1 CLR = 1;
		#1 CLR = 0;
		#1 data = 1;
	end
	
	initial begin
		$display("---------------------------");
		$display("Alexandre Palmieri Sad");
		$display("440265");
		$display("---------------------------");
		$monitor("%5b ---> %d", saida, saida);	
		#630 $finish; // -- de 31 a 0	
		$finish;
	end
endmodule