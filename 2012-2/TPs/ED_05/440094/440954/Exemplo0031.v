// -------------------------
// Exemplo0031 - SOMADOR ALGEBRICO
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "publico.v"

// -------------------------
// somadorAlgebrico
// -------------------------
module somadorAlgebrico();
	reg [2:0]a;
	reg [2:0]b;
	wire [2:0]cout;
	wire [2:0]s;
	wire [2:0]p;
	wire x;
	reg cin;
	
	entradaB EN1(p[0], b[0], cin);
	entradaB EN2(p[1], b[1], cin);
	entradaB EN3(p[2], b[2], cin);
	
	fullAdder FA1(s[0], cout[0], a[0], p[0], cin);
	fullAdder FA2(s[1], cout[1], a[1], p[1], cout[0]);
	fullAdder FA3(s[2], cout[2], a[2], p[2], cout[1]);
	
	xor XOR1(x, cout[2], cin);

	initial begin
			a=3'b000; b=3'b000; cin=0;
		$display("Exemplo0031 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Somador algebrico para calcular a soma e a subtracao\n");
		$display("  a    +    b   =   s    carry\n");
		$monitor("%b(%d) + %b(%d) = %b(%d) --- %b", a, a, b, b, s, s, x);
			#1 a=3'b101; b=3'b011;
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

			#1 a=3'b000; b=3'b000;cin=1;
		$display("\n  a    -    b   =   s    carry\n");
		$monitor("%b(%d) - %b(%d) = %b(%d) --- %b", a, a, b, b, s, s, x);
			#1 a=3'b101; b=3'b011;
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
	
endmodule // somadorAlgebrico