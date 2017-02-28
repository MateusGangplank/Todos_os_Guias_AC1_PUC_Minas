// ------------------------- 
// Guia08_02 - Registrador de Deslocamento
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

// --------------------------------------------------------------------------------------
// --  Registrador de deslocamento para a esquerda 4 bits (estágios) 
// --------------------------------------------------------------------------------------
module leftRegister (output [3:0]s, input d, input clk);
wire nots;
wire d1, d2, d3;
	
	ffd FF0 (s[0], nots, d, clk);

	or OR1 (d1, d, s[0]);
	ffd FF1 (s[1], nots, d1, clk);

	or OR2 (d2, d, s[1]);
   ffd FF2 (s[2], nots, d2, clk);

	or OR3 (d3, d, s[2]);
	ffd FF3 (s[3], nots, d3, clk);
	
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
		$display("Guia08_02 - Bruno Cezar Andrade Viallet - 396679"); 
		$display("D CLOCK SAIDA");
		d = 1;
		$monitor("%1b    %1b    %4b", d, clock, saida);
		#23 d = 0;
		#120 $finish;
	end

endmodule //teste
