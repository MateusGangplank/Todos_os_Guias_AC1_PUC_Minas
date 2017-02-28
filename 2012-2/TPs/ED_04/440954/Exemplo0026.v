// -------------------------
// Exemplo0026 - SOMADOR ALGEBRICO
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "publico.v"

// -------------------------
// modulo somador algebrico
// -------------------------
module somadorAlgebrico();
	reg [2:0]a;
	reg [2:0]b;
	wire [2:0]x;
	wire [2:0]y;
	wire [2:0]s;
	wire [2:0]cout;
	reg cin;
	reg chave;
	
	complementoDois CD1(x, b);
	switch SW1(y, b, x, cin);
	
	fullAdder FA1(s[0], cout[0], a[0], y[0], 0);
	fullAdder FA2(s[1], cout[1], a[1], y[1], cout[0]);
	fullAdder FA3(s[2], cout[2], a[2], y[2], cout[1]);
	
	
	initial begin
			a=3'b000; b=3'b000; cin=0;
		$display("Exemplo0026 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Somador algebrico 3 bits\n");
		$display("carry out = 0");
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
			a=3'b000; b=3'b000; cin=1;
		#1 $monitor("%b(%d) - %b(%d) = %b(%d) --- %b", a, a, b, b, s, s, cout[2]);
		$display("\ncarry out = 1");
		$display("  a    -    b   =   s    borrow\n");
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

endmodule // somadorAlgebrico