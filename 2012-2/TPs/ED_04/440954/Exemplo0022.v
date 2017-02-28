// -------------------------
// Exemplo0022 - FULL SUBTRACTOR
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "publico.v"

// -------------------------
// moduloFs
// -------------------------
module moduloFs();
	reg [2:0]a;
	reg [2:0]b;
	wire [2:0]bout;
	wire [2:0]s;
	
	fullSubtractor FS1(s[0], bout[0], a[0], b[0], 0);
	fullSubtractor FS2(s[1], bout[1], a[1], b[1], bout[0]);
	fullSubtractor FS3(s[2], bout[2], a[2], b[2], bout[1]);

	initial begin
			a=3'b000; b=3'b000;
		$display("Exemplo0022 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Full Subtractor 3 bits\n");
		$display("  a    -    b   =   s    borrow\n");
		$monitor("%b(%d) - %b(%d) = %b(%d) --- %b", a, a, b, b, s, s, bout[2]);
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
	
endmodule // moduloFs