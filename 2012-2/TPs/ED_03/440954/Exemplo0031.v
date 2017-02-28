// -------------------------
// Exemplo0031 - F4
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// f4_gate
// -------------------------
module f4(output [3:0]s, output [3:0]p, input [3:0]a, input [3:0]b);
	and and1(s[0], a[0], b[0]);
	and and2(s[1], a[1], b[1]);
	and and3(s[2], a[2], b[2]);
	and and4(s[3], a[3], b[3]);
	or or1(p[0], a[0], b[0]);
	or or2(p[1], a[1], b[1]);
	or or3(p[2], a[2], b[2]);
	or or4(p[3], a[3], b[3]);
endmodule // f4_gate

// -------------------------
// testef4
// -------------------------
module test_f4;
// ------------------------- definir dados
	reg [3:0]a;
	reg [3:0]b;
	wire [3:0]x;
	wire [3:0]y;

	f4 modulo(x,y,a,b);

// ------------------------- parte principal

	initial begin
		$display("Exemplo0031 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test LU's module");

			a=4'b0011;	b=4'b0101;
		$monitor("\n%b & %b = %b\n%b | %b = %b", a, b, x, a, b, y);
		#1 a=4'b0000;	b=4'b1111;
		#1 a=4'b0001;	b=4'b1110;
		#1 a=4'b0101;	b=4'b1010;
		#1 a=4'b1100;	b=4'b1100;
		#1 a=4'b1001;	b=4'b0110;
	end

endmodule // test_f4
