// -------------------------
// Exemplo0021 - FULL ADDER
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "publico.v"

// -------------------------
// moduloFa
// -------------------------
module moduloFa();
	reg [2:0]a;
	reg [2:0]b;
	wire [2:0]cout;
	wire [2:0]s;
	
	fullAdder FA1(s[0], cout[0], a[0], b[0], 0);
	fullAdder FA2(s[1], cout[1], a[1], b[1], cout[0]);
	fullAdder FA3(s[2], cout[2], a[2], b[2], cout[1]);

	initial begin
			a=3'b000; b=3'b000;
		$display("Exemplo0021 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Full Adder 3 bits\n");
		$display("  a    +    b   =   s    carry\n");
		$monitor("%b(%d) + %b(%d) = %b(%d) --- %b", a, a, b, b, s, s, cout[2]);
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
	
endmodule // moduloFa