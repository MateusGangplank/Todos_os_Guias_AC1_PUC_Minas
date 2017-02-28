//Exercicio 4
//Nome: Vitor Angelo Lima
//Matrícula: 451621

module  nandgate( output c, input a, input b);
	assign c = ~a | ~b;
endmodule

module testgate;
	reg a, b;
	wire c;
	nandgate gate1 (c, a, b);
	
	initial begin
		a = 0;
		b = 0;
	end
	
	initial begin
		$monitor ("( ~%b | ~%b ) = %b", a, b, c);
		#1 a = 0; b = 0;
		#1 a = 0; b = 1;
		#1 a = 1; b = 1;
		#1 a = 1; b = 0;
	end
endmodule
		
		
		
			
