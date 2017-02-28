//Exemplo0031
//Nome: Vitor Angelo Lima
//Matricula: 451621

module andgate ( output [3:0] s, input [3:0] a, input [3:0] b );
	and ( s [0], a [0], b[0] );
	and ( s [1], a [1], b[1] );
	and ( s [2], a [2], b[2] );
	and ( s [3], a [3], b[3] );
endmodule

module orgate ( output [3:0] s, input [3:0] a, input [3:0] b );
	or ( s [0], a [0], b[0] );
	or ( s [1], a [1], b[1] );
	or ( s [2], a [2], b[2] );
	or ( s [3], a [3], b[3] );
endmodule

module test;
	reg [3:0] a;
	reg [3:0] b;
	wire [3:0] r;
	wire [3:0] s;
	andgate and1 ( s, a, b);
	orgate or1 ( r, a, b );
	initial begin
		a = 4'b0011;
		b = 4'b0101;
		#1 $display( "OR = %4b, AND = %4b", r, s );
	end
endmodule
