//Exemplo 0037
//Nome: Vitor Angelo Lima
//Matricula: 451621

module abgate ( output s, input a, input b );
	wire c;
	xor ( c, a, b );
	and ( s, a, c );
endmodule

module abgate2 ( output s, input [1:0] a, input [1:0] b );
	wire c [1:0];
	wire d [1:0];
	wire e [1:0];
	wire f [1:0];
	abgate ab1 ( c[0], a[0], b[0] );
	abgate ab2 ( c[1], a[1], b[1] );
	
	abgate ab3 ( d[0], b[0], a[0] );
	abgate ab4 ( d[1], b[1], a[1] );
	
	not ( e[0], d[0] );
	not ( e[1], d[1] );
	
	and ( f[0], c[0], e[0] );
	and ( f[1], c[1], e[1] );
	or ( s, f[0], f[1] );
endmodule

module test;
	reg [1:0] a;
	reg [1:0] b;
	reg c;
	wire n; //chave negada
	wire r1;
	wire r2;
	wire r3;
	wire r4;
	wire saida;
	
	not ( n, c );
	
	abgate2 a1 ( r1, a, b );
	abgate2 b1 ( r2, b, a );
	
	and ( r3, r1, c ); //maior
	and ( r4, r2, n ); //menor
	or ( saida, r4, r2 );
	
	initial begin
		$display( "A  B  C A>B B>A SAIDA" );
		$monitor ("%2b %2b %1b  %1b   %1b   %1b", a, b, c, r3, r4, saida );
		a = 00; b = 00; c = 0;
		#1 a = 00; b = 01;
		#1 a = 00; b = 10;
		#1 a = 00; b = 11;
		#1 a = 01; b = 00;
		#1 a = 01; b = 01;
		#1 a = 01; b = 10; //Valor errado se c = 1
		#1 a = 01; b = 11;
		#1 a = 10; b = 00;
		#1 a = 10; b = 01; //Valor errado se c = 0
		#1 a = 10; b = 10;
		#1 a = 10; b = 11;
		#1 a = 11; b = 00;
		#1 a = 11; b = 01;
		#1 a = 11; b = 10;
		#1 a = 11; b = 11;
		//nao consegui entender o por que do erro
	end
endmodule
