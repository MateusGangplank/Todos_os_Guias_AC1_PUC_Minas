//Exemplo 0032
//Nome: Vitor Angelo Lima
//Matricula: 451621

module final ( output[3:0] s, input [3:0] a, input [3:0] b );
	or ( s[0], a[0], b[0] );
	or ( s[1], a[1], b[1] );
	or ( s[2], a[2], b[2] );
	or ( s[3], a[3], b[3] );
endmodule

module andgate( output[3:0] s, input c, input [3:0] a, input [3:0] b );
	wire [3:0] d;
	wire e;
	not( e, c );
	
	and ( d[0], a[0], b[0] );
	and ( d[1], a[1], b[1] );
	and ( d[2], a[2], b[2] );
	and ( d[3], a[3], b[3] );
	
	and ( s[0], d[0], e );
	and ( s[1], d[1], e );
	and ( s[2], d[2], e );
	and ( s[3], d[3], e );
endmodule

module orgate( output[3:0] s, input c, input [3:0] a, input [3:0] b );
	wire [3:0] d;
	wire e;
	
	or ( d[0], a[0], b[0] );
	or ( d[1], a[1], b[1] );
	or ( d[2], a[2], b[2] );
	or ( d[3], a[3], b[3] );
	
	and ( s[0], d[0], c );
	and ( s[1], d[1], c );
	and ( s[2], d[2], c );
	and ( s[3], d[3], c );
endmodule

module test;
	/*
	AND = 0
	OR = 1
	*/
	reg [3:0] a;
	reg [3:0] b;
	reg c;
	wire [3:0] d;
	wire [3:0] e;
	wire [3:0] f;
	
	andgate and1 ( d, c, a, b );
	orgate or1 ( e, c, a, b );
	
	final f1( f, e, d );
	
	initial begin
		a = 4'b0011;
		b = 4'b0101;
		c = 0;
		 #1 $display ( "%4b", f );
	end
endmodule
