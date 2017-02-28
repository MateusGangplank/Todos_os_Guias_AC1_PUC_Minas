// -------------------------
// Exercicio06 - EXTRA01
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// -- Operacoes
// -------------------------
module Operacoes (output [7:0] s, input [7:0] a);
	assign s = ~a;
endmodule // operacoes

// -------------------------
// -- Test operacoes
// -------------------------
module testoperacoes;
// ------------------------- definir dados
	reg [7:0] a;
	wire [7:0] s;
// ------------------------- instancia
	Operacoes OP1 (s,a);
// ------------------------- parte principal
	initial begin:start
		a=0;	end

	initial begin
		$display("Exercicio06 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test operacoes");
		
		$display("\nComplementar de 1\n");
		$monitor("a = %b = %b", a, s);
		#1 a=8'b00000001;
		#1 a=8'b00000010;
		#1 a=8'b00000100;
		#1 a=8'b00001000;
		#1 a=8'b00010000;
		#1 a=8'b00100000;
		#1 a=8'b01000000;
		#1 a=8'b10000000;
		#1 a=8'b11111111;
	end

endmodule // testoperacoes