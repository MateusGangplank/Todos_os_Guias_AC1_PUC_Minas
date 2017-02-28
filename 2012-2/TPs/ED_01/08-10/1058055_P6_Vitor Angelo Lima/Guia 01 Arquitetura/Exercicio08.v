//Exercicio 08
//Nome: Vitor Angelo Lima
//Matrícula: 451621

module  andgate( output e, input a, input b, input c, input d);
	assign e = (a & b & c & d);
endmodule

module testgate;
	reg a, b, c, d;
	wire e;
	andgate gate1 (e, a, b, c, d);
	
	initial begin
		a = 0; b = 0; c=0; d=0;
		#1 $monitor ("( %b & %b & %b & %b  ) = %b", a, b, c, d, e);
		#1 a = 0; b = 0; c = 0; d = 0;
		#1 a = 1; b = 1; c = 1; d = 1;
		#1 a = 1; b = 0; c = 1; d = 0;
		#1 a = 0; b = 0; c = 1; d = 1;
	end
endmodule
		
		
		
			
