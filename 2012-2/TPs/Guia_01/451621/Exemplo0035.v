//Exemplo 0035
//Nome: Vitor Angelo Lima
//Matricula: 451621

module final ( output[3:0] s, input [3:0] a, input [3:0] b,  input [3:0] c,  input [3:0] d,  input [3:0] e,  input [3:0] f );
	wire [3:0] s1; //and ou nand
	wire [3:0] s2; //or ou nor
	wire [3:0] s3; //xor ou xnor
	wire [3:0] s4; // s1 ou s2
	// s = s3 ou s4;
	
	orsimples or1 ( s1, a, b );
	orsimples or2 ( s2, c, d );
	orsimples or3 ( s3, e, f );
	orsimples or4 ( s4, s1, s2 );
	orsimples or5 ( s, s3, s4 );
endmodule

module orsimples ( output[3:0] s, input [3:0] a, input [3:0] b );
	or ( s[0], a[0], b[0] );
	or ( s[1], a[1], b[1] );
	or ( s[2], a[2], b[2] );
	or ( s[3], a[3], b[3] );
endmodule

module andgate( output[3:0] s, input [2:0] c, input [3:0] a, input [3:0] b );
	wire [3:0] d; // operacao a e b
	wire [2:0] n; // chave negada
	wire aux; // auxiliar para AND da chave
	wire u; // AND bits chave
	
	and ( d[0], a[0], b[0] );
	and ( d[1], a[1], b[1] );
	and ( d[2], a[2], b[2] );
	and ( d[3], a[3], b[3] );
	
	not( n[0], c[0] );
	not( n[1], c[1] );
	not( n[2], c[2] );
	
	and ( aux, n[0], n[1] );
	and ( u, aux, n[2] );
	
	and ( s[0], u, d[0] );
	and ( s[1], u, d[1] );
	and ( s[2], u, d[2] );
	and ( s[3], u, d[3] );
endmodule

module nandgate( output[3:0] s, input [2:0] c, input [3:0] a, input [3:0] b );
	wire [3:0] d; // operacao a e b
	wire [2:0] n; // chave negada
	wire aux; // auxiliar para AND da chave
	wire u; // AND bits chave
	
	nand ( d[0], a[0], b[0] );
	nand ( d[1], a[1], b[1] );
	nand ( d[2], a[2], b[2] );
	nand ( d[3], a[3], b[3] );
	
	not( n[0], c[0] );
	not( n[1], c[1] );
	not( n[2], c[2] );
	
	and ( aux, c[0], n[1] );
	and ( u, aux, n[2] );
	
	and ( s[0], u, d[0] );
	and ( s[1], u, d[1] );
	and ( s[2], u, d[2] );
	and ( s[3], u, d[3] );
endmodule

module orgate( output[3:0] s, input [2:0] c, input [3:0] a, input [3:0] b );
	wire [3:0] d; // operacao a e b
	wire [2:0] n; // chave negada
	wire aux; // auxiliar para AND da chave
	wire u; // AND bits chave
	
	or ( d[0], a[0], b[0] );
	or ( d[1], a[1], b[1] );
	or ( d[2], a[2], b[2] );
	or ( d[3], a[3], b[3] );
	
	not( n[0], c[0] );
	not( n[1], c[1] );
	not( n[2], c[2] );
	
	and ( aux, n[0], c[1] );
	and ( u, aux, n[2] );
	
	and ( s[0], u, d[0] );
	and ( s[1], u, d[1] );
	and ( s[2], u, d[2] );
	and ( s[3], u, d[3] );
endmodule

module norgate( output[3:0] s, input [2:0] c, input [3:0] a, input [3:0] b );
	wire [3:0] d; // operacao a e b
	wire [2:0] n; // chave negada
	wire aux; // auxiliar para AND da chave
	wire u; // AND bits chave
	
	nor ( d[0], a[0], b[0] );
	nor ( d[1], a[1], b[1] );
	nor ( d[2], a[2], b[2] );
	nor ( d[3], a[3], b[3] );
	
	not( n[0], c[0] );
	not( n[1], c[1] );
	not( n[2], c[2] );
	
	and ( aux, c[0], c[1] );
	and ( u, aux, n[2] );
	
	and ( s[0], u, d[0] );
	and ( s[1], u, d[1] );
	and ( s[2], u, d[2] );
	and ( s[3], u, d[3] );
endmodule

module xorgate( output[3:0] s, input [2:0] c, input [3:0] a, input [3:0] b );
	wire [3:0] d; // operacao a e b
	wire [2:0] n; // chave negada
	wire aux; // auxiliar para AND da chave
	wire u; // AND bits chave
	
	xor ( d[0], a[0], b[0] );
	xor ( d[1], a[1], b[1] );
	xor ( d[2], a[2], b[2] );
	xor ( d[3], a[3], b[3] );
	
	not( n[0], c[0] );
	not( n[1], c[1] );
	not( n[2], c[2] );
	
	and ( aux, n[0], n[1] );
	and ( u, aux, c[2] );
	
	and ( s[0], u, d[0] );
	and ( s[1], u, d[1] );
	and ( s[2], u, d[2] );
	and ( s[3], u, d[3] );
endmodule

module xnorgate( output[3:0] s, input [2:0] c, input [3:0] a, input [3:0] b );
	wire [3:0] d; // operacao a e b
	wire [2:0] n; // chave negada
	wire aux; // auxiliar para AND da chave
	wire u; // AND bits chave
	
	xnor ( d[0], a[0], b[0] );
	xnor ( d[1], a[1], b[1] );
	xnor ( d[2], a[2], b[2] );
	xnor ( d[3], a[3], b[3] );
	
	not( n[0], c[0] );
	not( n[1], c[1] );
	not( n[2], c[2] );
	
	and ( aux, c[0], n[1] );
	and ( u, aux, c[2] );
	
	and ( s[0], u, d[0] );
	and ( s[1], u, d[1] );
	and ( s[2], u, d[2] );
	and ( s[3], u, d[3] );
endmodule


module test;
	/*
	AND = 000
	NAND = 001
	OR = 010
	NOR = 011
	XOR = 100
	XNOR = 101
	*/
	reg [3:0] a;
	reg [3:0] b;
	reg [2:0] c;
	wire [3:0] result;
	
	wire [3:0] t;
	wire [3:0] h;
	wire [3:0] e;
	wire [3:0] l;
	wire [3:0] d;
	wire [3:0] o;
	
	andgate z0 ( t, c, a, b );
	nandgate z1 ( h, c, a, b );
	orgate z2 ( e, c, a, b );
	norgate z3 ( l, c, a, b );
	xorgate z4 ( d, c, a, b );
	xnorgate z5 ( o, c, a, b );
	
	final f1 ( result, t, h, e, l, d, o );
	
	initial begin
		$monitor ( "%4b", result );
		a = 4'b0011;
		b = 4'b0101;
		c = 000;
		#1 c = 001;
		#1 c = 010;
		#1 c = 011;
		#1 c = 100;
		#1 c = 101;
	end
endmodule
