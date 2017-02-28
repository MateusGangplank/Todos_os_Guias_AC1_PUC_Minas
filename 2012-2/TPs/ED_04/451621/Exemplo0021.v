//Exemplo 0021
//Nome: Vitor Angelo Lima
//Matricula: 451621

module somador ( output c, output s, input a, input b, input c1 );
	wire x1;
	wire a1;
	wire a2;
	
	xor ( x1, a, b );
	and ( a1, a, b );
	xor ( s, x1, c1 );
	and ( a2, x1, c1 );
	or ( c, a1, a2 );	
endmodule

module soma ( output [2:0] s, input [2:0] a, input [2:0] b );
	wire s0; wire c0;
	wire s1; wire c1;
	wire s2; wire c2;
	
	somador sm0 ( c0, s0, a[0], b[0], 1'b0 );
	somador sm1 ( c1, s1, a[1], b[1], c0 );
	somador sm2 ( c2, s2, a[2], b[2], c1 );
	
	and ( s[0], s0 );
	and ( s[1], s1 );
	and ( s[2], s2 );
endmodule

module test;
	reg [2:0] a;
	reg [2:0] b;
	wire [2:0] s;
	soma sm ( s, a, b );
	
	initial begin
		$monitor ( "%3b", s );
		a = 3'b000; b = 3'b000;
		#1 a = 3'b000; b = 3'b001;
		#1 a = 3'b001; b = 3'b001;
		#1 a = 3'b011; b = 3'b001;
		#1 a = 3'b111; b = 3'b000;
		#1 a = 3'b111; b = 3'b111;
	end
endmodule



