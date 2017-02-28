// -------------------------
// Exemplo0024 - COMPARADOR DIFERENCA
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "publico.v"

// -------------------------
// moduloCompareD
// -------------------------
module moduloCompared();
	reg [2:0]a;
	reg [2:0]b;
	wire s;
	
	compareDiferenca CD1(s, a, b); //se s=1 entao (a e b) sao diferentes

	initial begin
			a=3'b000; b=3'b000;
		$display("Exemplo0024 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Comparador Diferenca 3 bits\n");
		$display("  a    <>    b   \n");
		$monitor("%b(%d) <> %b(%d) ---- %b", a, a, b, b, s);
			#1 a=3'b001; b=3'b011;
			#1 a=3'b010; b=3'b110;
			#1 a=3'b011; b=3'b100;
			#1 a=3'b100; b=3'b010;
			#1 a=3'b101; b=3'b001;
			#1 a=3'b110; b=3'b001;
			#1 a=3'b111; b=3'b000;
			#1 a=3'b011; b=3'b011;
			#1 a=3'b100; b=3'b010;
			#1 a=3'b001; b=3'b001;
			#1 a=3'b110; b=3'b100;
			#1 a=3'b101; b=3'b101;
			#1 a=3'b010; b=3'b010;
			#1 a=3'b111; b=3'b111;

	end
	
endmodule // moduloCompared