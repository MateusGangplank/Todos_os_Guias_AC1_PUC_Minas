// -------------------------------------------------
// -- Alexandre Palmieri Sad
// -- 440265
// -- Exercicio001
// -------------------------------------------------
`include "clock.v"
`include "FFD.v"


//--------------------------------------------------
// -- MODULE TESTE
//--------------------------------------------------
module RDE4B(qa, qb, qc, qd, d, clk);
	output qa;
	output qb;
	output qc;
	output qd;
	input  d;
	input  clk;
	
	reg  preset;
	wire qa, qb, qc, qd; 
	wire qnota, qnotb, qnotc, qnotd;
	
	initial begin
		preset = 1;
	end
	
	dff2 A(qa, qnota, 1, clk);
	dff2 B(qb, qnotb, qc, clk);
	dff2 C(qc, qnotc, qd, clk);
	dff2 D(qd, qnotd, d, clk);
	
	always @(posedge clk)
		begin
		$display("%d -> %b%b%b%b",$time, qa, qb, qc, qd);
		end
endmodule

//--------------------------------------------------
// -- MODULE TESTE
//--------------------------------------------------
module teste;
	wire clk;
	reg d;
	wire qa, qb, qc, qd;
	
	clock ck( clk );
	RDE4B rde(qa, qb, qc, qd, d, clk);
		
	initial begin
		$display("---------------------------");
		$display("Alexandre Palmieri Sad");
		$display("440265");
		$display("---------------------------");
		d = 0;
		#5 d = 1;
		#5 d = 0;
		#5 d = 0;
		#5 d = 0;
		#25 $finish;
		
	end
	
endmodule