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

	dff DFF0 (s[0], nots, a, clk);
	dff DFF1 (s[1], nots, s[0], clk);
	dff DFF2 (s[2], nots, s[1], clk);
	dff DFF3 (s[3], nots, s[2], clk);
	dff DFF4 (s[4], nots, s[3], clk);

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