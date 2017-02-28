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

//-------------------------
//-- FULL ADDER
//-------------------------

		module fa ( s0, cout, cin, x, y );
			
			output	s0, cout, s1;
			input		x, y, cin;
			
			
				//Instancia
			ha HA1 ( s2, s3, x, y );
			ha HA2 ( s0, s1, s2, cin ); 
			or OR1 ( cout, s1, s3 );
		
		endmodule
		
//----------------------------
//-- SOMADOR 3 BITS
//----------------------------

	module sum ( s0, s1, s2, cout, cin, a0, a1, a2, b0, b1, b2 );
	
		output s0, s1, s2, cout;
		input  cin, a0, a1, a2, b0, b1, b2;
		
			//Instancia
		fa FA1 ( s0, c1, cin, a0, b0 );
		fa FA2 ( s1, c2, c1, a1, b1 );
		fa FA3 ( s2, cout, c2, a2, b2 );	
			
	endmodule
		
//----------------------------
//-- TESTE SOMADOR 3 BITS
//----------------------------

	module testesomador;
		
		reg   a0, a1, a2, b0, b1, b2, cin;
		wire  s0, s1, s2, cout;
	
		sum SUM1 ( s0, s1, s2, cout, cin, a0, a1, a2, b0, b1, b2 );
		
				//Start
		initial begin: start
			cin = 0; a0 = 0; a1 = 0; a2 = 0; b0 = 0; b1 = 0; b2 = 0;
		end
		
		
				// Main
		initial begin:main
			$display ("Guia 04 - Gustavo Guimaraes - 405804");
			$display ("Teste SOMADOR 3 BITS");
			$display ("\nCin    A      B  = Cout s2  s1  s0\n");
			$monitor (" %b    %b%b%b    %b%b%b =   %b   %b  %b   %b", cin, a2,a1,a0, b2,b1,b0, cout, s2, s1, s0);
		#1 cin = 0; a0 = 0; a1 = 0; a2 = 1; b0 = 0; b1 = 0; b2 = 1;
		#1 cin = 0; a0 = 0; a1 = 1; a2 = 0; b0 = 0; b1 = 1; b2 = 0;
		#1 cin = 0; a0 = 0; a1 = 1; a2 = 1; b0 = 0; b1 = 1; b2 = 1;
		#1 cin = 0; a0 = 1; a1 = 0; a2 = 0; b0 = 1; b1 = 0; b2 = 0;
		#1 cin = 0; a0 = 1; a1 = 0; a2 = 1; b0 = 1; b1 = 0; b2 = 1;
		#1 cin = 0; a0 = 1; a1 = 1; a2 = 0; b0 = 1; b1 = 1; b2 = 0;
		#1 cin = 0; a0 = 1; a1 = 1; a2 = 1; b0 = 1; b1 = 1; b2 = 1;

		end	
		
	endmodule //testesomador	
	