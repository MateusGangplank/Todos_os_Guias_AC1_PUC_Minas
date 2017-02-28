//Exemplo 0036
//Nome: Vitor Angelo Lima
//Matricula: 451621

module xnorgate ( output s, input [1:0] a, input [1:0] b );
	wire [1:0] c;
	xnor ( c[0], a[0], b[0] );
	xnor ( c[1], a[1], b[1] );
	and ( s, c[0], c[1] );
endmodule

module test;
	reg [1:0] a;
	reg [1:0] b;
	reg c;
	wire d;
	wire e;
	
	xnorgate xn ( d, a, b );
	xor ( e, c, d );
	
	initial begin
		a = 2'b00;
		b = 2'b00;
		c = 0; //chave igual
		#1 $display ( e );
		c = 1; //chave diferente
		#1 $display ( e );
	end
endmodule
