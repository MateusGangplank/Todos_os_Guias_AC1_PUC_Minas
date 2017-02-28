// -------------------------
// Exemplo0027 - COMPARADOR IGUALDADE / DIFERENCA
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "publico.v"

// -------------------------
// modulo comparador
// -------------------------
module compara();
	reg [2:0]a;
	reg [2:0]b;
	reg chave;
	wire s;
	
	comparador CP1(s, a, b, chave);

	
	initial begin
		a=3'b100; b=3'b100; chave=0;
		$display("Exemplo0027 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Comparador\n");
		$display("chave = 0");
		$display("a = b ---- diferente\n");
		$monitor("%b = %b ---- %b", a, b, s);
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
			#1 a=3'b001; b=3'b001;
			#1 a=3'b010; b=3'b010;
			#1 a=3'b001; b=3'b001;
			
			#1 a=3'b100; b=3'b100; chave=1;
		$display("\nchave = 1");
		$display("a = b ---- igual\n");
		$monitor("%b = %b ---- %b", a, b, s);
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
			#1 a=3'b001; b=3'b001;
			#1 a=3'b010; b=3'b010;
			#1 a=3'b001; b=3'b001;
			
	end

endmodule // compara