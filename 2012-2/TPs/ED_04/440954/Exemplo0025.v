// -------------------------
// Exemplo0025 - COMPLEMENTO DE DOIS
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "publico.v"

// -------------------------
// modulo complemento de dois
// -------------------------
module moduloComplemento();
	reg [2:0]a;
	wire [2:0]s;
	
	complementoDois CD1(s, a);
	
	initial begin
			a=3'b000;
		$display("Exemplo0025 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Complemento de dois (3 bits)\n");
		$display("a   = ~a + 1\n");
		$monitor("%b = %b", a, s);
			#1 a=3'b001;
			#1 a=3'b010;
			#1 a=3'b011;
			#1 a=3'b100;
			#1 a=3'b101;
			#1 a=3'b110;
			#1 a=3'b111;
			
	end
	
endmodule // moduloComplemento