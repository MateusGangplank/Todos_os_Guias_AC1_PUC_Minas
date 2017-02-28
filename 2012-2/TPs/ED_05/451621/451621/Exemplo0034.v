// Exemplo 0034
//Nome: Vitor Angelo Lima
//Matricula: 451621

module complemento1 ( output [2:0] s, input [2:0] a );
	not ( s[0], a[0] );
	not ( s[1], a[1] );
	not ( s[2], a[2] );
endmodule

module soma ( output c, output s, input a, input b, input c1 );
	wire x1;
	wire a1;
	wire a2;
	
	xor ( x1, a, b );
	and ( a1, a, b );
	xor ( s, x1, c1 );
	and ( a2, x1, c1 );
	or ( c, a1, a2 );	
endmodule

module decidir ( output [2:0] s, input [2:0] b, input [2:0] bc, input c );
	wire n; //carry negado
	wire [2:0] a0; wire [2:0] a1;
	not ( n, c );
	
	and ( a0[0], b[0], n );
	and ( a0[1], b[1], n );
	and ( a0[2], b[2], n );
	
	and ( a1[0], bc[0], c );
	and ( a1[1], bc[1], c );
	and ( a1[2], bc[2], c );
	
	or ( s[0], a0[0], a1[0] );
	or ( s[1], a0[1], a1[1] );
	or ( s[2], a0[2], a1[2] );
endmodule

module operacao ( output [2:0] s, input [2:0] a, input [2:0] b, input c );
	wire [2:0] bc; wire [2:0] b1; //bc = complemento de 1 de b --- b1 = b | bc
	wire s0; wire c0;
	wire s1; wire c1;
	wire s2; wire c2;
	
	complemento1 c1A ( bc, b );
	decidir dc ( b1, b, bc, c );
	
	soma sm0 ( c0, s0, a[0], b1[0], c );
	soma sm1 ( c1, s1, a[1], b1[1], c0 );
	soma sm2 ( c2, s2, a[2], b1[2], c1 );
	
	and ( s[0], s0 );
	and ( s[1], s1 );
	and ( s[2], s2 );
endmodule

module flagzero ( output z, input [2:0] s );
	nor ( z, s[0], s[1], s[2] );
endmodule

module incremento ( output [2:0] s, input [2:0] a );
	operacao op ( s, a, 3'b001, 1'b0 );	
endmodule

module overflow ( output s, input [2:0] a, input [2:0] b, input c );
	wire n;
	not ( n, c );
	and ( s, a[1], b[1], n);
endmodule

module carry ( output s, input [2:0] a, input c );
	wire n;
	not ( n, c );
	and ( s, a[2], n );
endmodule

module sinal ( output s, input [2:0] a );
	and ( s, a[2], a[2] );
endmodule

module decremento ( output [2:0] s, input [2:0] a );
	operacao op ( s, a, 3'b001, 1'b1 );	
endmodule

module executar;
	reg [2:0] a;
	reg [2:0] b;
	reg c;
	wire [2:0] s;
	wire [2:0] d; //b-1
	
	decremento dc ( d, b );
	operacao op ( s, a, d, c );
	
	initial begin
		$monitor ( "%3b    %3b %3b-1   %1b", s, a, b, c );
		a = 3'b001; b = 3'b001; c = 0;
		#1 a = 3'b011; b = 3'b011; c = 0;
		#1 a = 3'b111; b = 3'b111; c = 0;
		#1 a = 3'b000; b = 3'b001; c = 1;
		#1 a = 3'b001; b = 3'b001; c = 1;
		#1 a = 3'b111; b = 3'b111; c = 1;
	end
endmodule
