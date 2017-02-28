// ---------------------
// AC1 - 29/08/2010
//	Guia 05 - v 0.1
//
// Nome: Gustavo Guimarães
// Matricula: 405804
// ---------------------


//----------------------
//-- HALF-ADDER
//----------------------
		module ha ( s0, s1, x, y );
		
			output s0, s1;
			input  x, y;
		
						// Instancia
			or  OR1  ( s3, x, y );
			and AND1 ( s1, x, y );
			not NOT1 ( s2, s1 );
			and AND2 ( s0, s2, s3 );
		
		endmodule
		
//----------------------
//-- Multiplicador
//----------------------

	module multiplicador ( s0, s1, s2, s3, a0, a1, b0, b1);
		output   s0, s1, s2, s3;
		input		a0, a1, b0, b1;
		
				//Instancia
			and AND1 ( s0, a0, b0 );
			and AND2 ( aux1, a0, b1 );
			and AND3 ( aux2, b0, a1 );
			and AND4 ( aux3, a1, b1 );
			ha  HA1  ( s1, aux4, aux1, aux2 );
			ha  HA2  ( s2, s3, aux3, aux4 );
			
	endmodule
	
//----------------------------
//-- TESTE MULTIPLICADOR 2 BITS
//----------------------------

	module testesubtrator;
		
		reg   a0, a1, b0, b1;
		wire  s0, s1, s2, s3;
	
		multiplicador MULTIPLICADOR1 ( s0, s1, s2, s3, a0, a1, b0, b1 );
		
				//Start
		initial begin: start
			a0 = 0; a1 = 0; b0 = 0; b1 = 0;
		end
		
		
				// Main
		initial begin:main
			$display ("Guia 04 - Gustavo Guimaraes - 405804");
			$display ("Teste MULTIPLICADOR 2 BITS");
			$display ("\nA      B  =  s3 s2 s1 s0\n");
			$monitor ("%b%b     %b%b =   %b  %b  %b  %b", a1,a0, b1,b0, s3, s2, s1, s0);
		#1 a0 = 0; a1 = 0; b0 = 0; b1 = 1; 
		#1 a0 = 0; a1 = 0; b0 = 1; b1 = 0; 
		#1 a0 = 0; a1 = 0; b0 = 1; b1 = 1;
		#1 a0 = 0; a1 = 1; b0 = 0; b1 = 0; 
		#1 a0 = 0; a1 = 1; b0 = 0; b1 = 1; 
		#1 a0 = 0; a1 = 1; b0 = 1; b1 = 0; 
		#1 a0 = 0; a1 = 1; b0 = 1; b1 = 1; 
		#1 a0 = 1; a1 = 0; b0 = 0; b1 = 0; 
		#1 a0 = 1; a1 = 0; b0 = 0; b1 = 1; 
		#1 a0 = 1; a1 = 0; b0 = 1; b1 = 0;
		#1 a0 = 1; a1 = 0; b0 = 1; b1 = 1; 
		#1 a0 = 1; a1 = 1; b0 = 0; b1 = 0; 
		#1 a0 = 1; a1 = 1; b0 = 0; b1 = 1; 
		#1 a0 = 1; a1 = 1; b0 = 1; b1 = 0; 
		#1 a0 = 1; a1 = 1; b0 = 1; b1 = 1;
		end	
		
	endmodule //testesubtrator	
	