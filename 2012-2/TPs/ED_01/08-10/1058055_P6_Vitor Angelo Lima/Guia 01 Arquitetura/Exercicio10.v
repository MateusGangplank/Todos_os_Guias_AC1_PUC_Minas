//Exercicio 10
//Nome: Vitor Angelo Lima
//Matrícula: 451621

module  orgate( output c, input a, input b);
	assign c = a | b ;
endmodule

module orgate2( output m, input a, input b, input c, input d );
	wire e, f;
	orgate a1( e, a, b);
	orgate a2( f, c, d);
	orgate a3( m, e, f );
endmodule

module testgate;
	reg a, b, c, d;
	wire e;
	orgate2 gate1 (e, a, b, c, d);
	
	initial begin
		a = 0; b = 0; c=0; d=0;
		#1 $monitor ("( %b | %b | %b | %b ) = %b", a, b, c, d, e);
		#1 a = 0; b = 0; c = 0; d = 0;
		#1 a = 1; b = 1; c = 1; d = 1;
		#1 a = 1; b = 0; c = 1; d = 0;
		#1 a = 0; b = 0; c = 1; d = 1;
	end
endmodule
		
		
		
			
