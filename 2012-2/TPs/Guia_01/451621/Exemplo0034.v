//Exemplo 0034
//Nome: Vitor Angelo Lima
//Matricula: 451621

module final ( output[3:0] s, input [3:0] a, input [3:0] b );
	or ( s[0], a[0], b[0] );
	or ( s[1], a[1], b[1] );
	or ( s[2], a[2], b[2] );
	or ( s[3], a[3], b[3] );
endmodule

module orgate( output[3:0] s, input c, input [3:0] a, input [3:0] b );
	wire [3:0] d;
	wire e;
	not( e, c );
	
	or ( d[0], a[0], b[0] );
	or ( d[1], a[1], b[1] );
	or ( d[2], a[2], b[2] );
	or ( d[3], a[3], b[3] );
	
	and ( s[0], d[0], e );
	and ( s[1], d[1], e );
	and ( s[2], d[2], e );
	and ( s[3], d[3], e );
endmodule

module norgate( output[3:0] s, input c, input [3:0] a, input [3:0] b );
	wire [3:0] d;
	wire e;
	not( e, c );
	
	nor ( d[0], a[0], b[0] );
	nor ( d[1], a[1], b[1] );
	nor ( d[2], a[2], b[2] );
	nor ( d[3], a[3], b[3] );
	
	and ( s[0], d[0], e );
	and ( s[1], d[1], e );
	and ( s[2], d[2], e );
	and ( s[3], d[3], e );
endmodule

module xorgate( output[3:0] s, input c, input [3:0] a, input [3:0] b );
	wire [3:0] d;
	wire e;
	
	xor ( d[0], a[0], b[0] );
	xor ( d[1], a[1], b[1] );
	xor ( d[2], a[2], b[2] );
	xor ( d[3], a[3], b[3] );
	
	and ( s[0], d[0], c );
	and ( s[1], d[1], c );
	and ( s[2], d[2], c );
	and ( s[3], d[3], c );
endmodule

module xnorgate( output[3:0] s, input c, input [3:0] a, input [3:0] b );
	wire [3:0] d;
	wire e;
	
	xnor ( d[0], a[0], b[0] );
	xnor ( d[1], a[1], b[1] );
	xnor ( d[2], a[2], b[2] );
	xnor ( d[3], a[3], b[3] );
	
	and ( s[0], d[0], c );
	and ( s[1], d[1], c );
	and ( s[2], d[2], c );
	and ( s[3], d[3], c );
endmodule

module test;
	/*
	OR / NOR = 0
	XOR / NXOR = 1
	*/
	reg [3:0] a;
	reg [3:0] b;
	reg c;
	
	wire [3:0] d;
	wire [3:0] e;
	wire [3:0] f;
	
	wire [3:0] g;
	wire [3:0] h;
	wire [3:0] i;
	
	orgate or1 ( d, c, a, b );
	xorgate xor1 ( e, c, a, b );
	final f1( f, e, d );
	
	norgate nor1 ( g, c, a, b );
	xnorgate xnor1 ( h, c, a, b );
	final f2( i, g, h );
	
	
	initial begin
		a = 4'b0011;
		b = 4'b0101;
		c = 1;
		 #1 $display ( "%4b %4b", f, i );
	end
endmodule
