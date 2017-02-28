// ---------------------
// AC1 - 22/08/2010
//	Guia 04 - v 0.1
//
// Nome: Gustavo Guimarães
// Matricula: 405804
// ---------------------


//--------------------------
//-- HALF-SUBTRACTOR
//--------------------------

	module hs ( s0, s1, x, y );
		
		output s0, s1;
		input  x, y;
		
			//INSTANCIA
		xor XOR1 ( s0, x, y );
		and AND1 ( s1, ~x, y);
		
	endmodule
	
//--------------------------
//-- FULL-SUBTRACTOR
//--------------------------

	module fs ( s0, c1, c0, x, y );
	
		output s0, c1;
		input	 x, y, c0;
		
		hs HS1 ( s2, s3, x, y );
		hs HS2 ( s0, s1, s2, c0 );
		or OR1 ( c1, s1, s3 );
		
	endmodule

//----------------------------
//-- FULL-SUB 2 BITS
//----------------------------

	module sub ( s0, s1, cout, cin, a0, a1, b0, b1 );
	
		output s0, s1, cout;
		input  cin, a0, a1, a2, b0, b1;
		
			//Instancia
		fs FS1 ( s0, c1, cin, a0, b0 );
		fs FS2 ( s1, cout, c1, a1, b1 );
			
	endmodule


//----------------------------
//-- TESTE SUBSTRATOR 2 BITS
//----------------------------

	module testesubtrator;
		
		reg   a0, a1, b0, b1, cin;
		wire  s0, s1, cout;
	
		sub SUB1 ( s0, s1, cout, cin, a0, a1, b0, b1 );
		
				//Start
		initial begin: start
			cin = 0; a0 = 0; a1 = 0; b0 = 0; b1 = 0;
		end
		
		
				// Main
		initial begin:main
			$display ("Guia 04 - Gustavo Guimaraes - 405804");
			$display ("Teste SUBTRATOR 2 BITS");
			$display ("\nCin    A      B  = Cout s1  s0\n");
			$monitor (" %b    %b%b    %b%b =   %b    %b  %b", cin, a1,a0, b1,b0, cout, s1, s0);
		#1 cin = 0; a0 = 0; a1 = 0; b0 = 0; b1 = 1; 
		#1 cin = 0; a0 = 0; a1 = 0; b0 = 1; b1 = 0; 
		#1 cin = 0; a0 = 0; a1 = 0; b0 = 1; b1 = 1;
		#1 cin = 0; a0 = 0; a1 = 1; b0 = 0; b1 = 0; 
		#1 cin = 0; a0 = 0; a1 = 1; b0 = 0; b1 = 1; 
		#1 cin = 0; a0 = 0; a1 = 1; b0 = 1; b1 = 0; 
		#1 cin = 0; a0 = 0; a1 = 1; b0 = 1; b1 = 1; 
		#1 cin = 0; a0 = 1; a1 = 0; b0 = 0; b1 = 0; 
		#1 cin = 0; a0 = 1; a1 = 0; b0 = 0; b1 = 1; 
		#1 cin = 0; a0 = 1; a1 = 0; b0 = 1; b1 = 0;
		#1 cin = 0; a0 = 1; a1 = 0; b0 = 1; b1 = 1; 
		#1 cin = 0; a0 = 1; a1 = 1; b0 = 0; b1 = 0; 
		#1 cin = 0; a0 = 1; a1 = 1; b0 = 0; b1 = 1; 
		#1 cin = 0; a0 = 1; a1 = 1; b0 = 1; b1 = 0; 
		#1 cin = 0; a0 = 1; a1 = 1; b0 = 1; b1 = 1;
		end	
		
	endmodule //testesubtrator	
	