// -------------------------
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

`include "clock.v" 
`include "dff.v"
 
// -----------------------------------------------------------
// --  Shift Register (Left), para 5 bits
// -----------------------------------------------------------
module shiftRegisterLeft (output[4:0] s, input a, input clk);
	wire nots;
	wire a1,a2,a3,a4;

	dff DFF0 (s[0], nots, a, clk);
	or OR1 (a1, a, s[0]);
	dff DFF1 (s[1], nots, a1, clk);
	or OR1 (a2, a, s[1]);
	dff DFF2 (s[2], nots, a2, clk);
	or OR1 (a3, a, s[2]);
	dff DFF3 (s[3], nots, a3, clk);
	or OR1 (a4, a, s[3]);
	dff DFF4 (s[4], nots, a4, clk);

endmodule //shiftRegisterLeft

// -------------------------
// -- Teste
// -------------------------
module teste;
	wire [4:0] saida;
	reg a;
	wire clock; 
	clock clk ( clock ); 
	
	shiftRegisterLeft SRL1 (saida, a, clock);
	
	initial begin
		$display("D  CLOCK  SAIDA");
		a = 1;
		$monitor("%1b    %1b    %4b", a, clock, saida);
		#25 a = 0;
		#120 $finish;
	end

endmodule //teste