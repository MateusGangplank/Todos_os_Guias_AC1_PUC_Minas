// ------------------------- 
// Guia08_01 - Registrador de Deslocamento
// Nome: Bruno Cezar Andrade Viallet 
// Matricula: 396679
// ------------------------- 

//-----------------------------
// -- CLOCK
//-----------------------------
`include "clock.v"

// -------------------------
// -- FLIP FLOP D
// -------------------------
module ffd(q,qnot,data,clk);
	output q;
	output qnot;
	input data;
	input clk;
	
	reg q,qnot;
	
	initial begin
		q = 1'b0;
		qnot = 1'b1;
	end
	always @ (posedge clk)
		begin
		q <= data;	qnot <= ~q;
		end
			
endmodule //ffd

// -----------------------------------------------------------------------
// --  Registrador de deslocamento 4bits
// -----------------------------------------------------------------------
module leftRegister (output [3:0]s, input d, input clk);
wire nots;

	ffd FF0 (s[0], nots, d, clk);
	ffd FF1 (s[1], nots, s[0], clk);
	ffd FF2 (s[2], nots, s[1], clk);
	ffd FF3 (s[3], nots, s[2], clk);

endmodule//leftRegister

// -------------------------
// -- Teste
// -------------------------

module teste;
wire [3:0] saida;
reg d;
wire clock; 
clock clk ( clock ); 
leftRegister LF1 (saida, d, clock);
	
	initial begin
		$display("Guia08_01 - Bruno Cezar Andrade Viallet - 396679"); 
		$display("D CLOCK SAIDA");
		d = 1;
		$monitor("%1b    %1b    %4b", d, clock, saida);
		#25 d = 0;
		#120 $finish;
	end

endmodule //teste
