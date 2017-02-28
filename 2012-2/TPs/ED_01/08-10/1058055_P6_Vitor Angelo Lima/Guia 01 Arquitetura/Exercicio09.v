//Exercicio 09
//Nome: Vitor Angelo Lima
//Matrícula: 451621

module  andgate( output c, input a, input b);
	assign c = a & b ;
endmodule

module andgate2( output m, input a, input b, input c, input d );
	wire e, f;
	andgate a1( e, a, b);
	andgate a2( f, c, d);
	andgate a3( m, e, f );
endmodule

module testgate;
	reg a, b, c, d;
	wire e;
	andgate2 gate1 (e, a, b, c, d);
	
	initial begin
		a = 0; b = 0; c=0; d=0;
		#1 $monitor ("( %b & %b & %b & %b ) = %b", a, b, c, d, e);
		#1 a = 0; b = 0; c = 0; d = 0;
		#1 a = 1; b = 1; c = 1; d = 1;
		#1 a = 1; b = 0; c = 1; d = 0;
		#1 a = 0; b = 0; c = 1; d = 1;

	end
endmodule
		
		
		
			
