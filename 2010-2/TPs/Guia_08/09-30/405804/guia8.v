// ---------------------
// AC1 - 29/09/2010
//	Guia 08 - v 0.1
//
// Nome: Gustavo Guimarães
// Matricula: 405804
// ---------------------

// ---------------------
// -- Exercicio 1
// ---------------------
module e1(s, a, b, c, d); 

	output s; 
	input  a,b,c,d; 
	wire aux1, aux2, aux3; 
	
	and AND1( aux1,  a, b, ~d );
	and AND2( aux2, ~a, c );
	and AND3( aux3, ~b, c ); 
	or  OR1 ( s, aux1, aux2, aux3); 
	
endmodule 

// ---------------------
// -- Exercicio 2
// ---------------------
module e2(s, a, b, c, d);

	output s;
	input  a,b,c,d;
   wire aux1, aux2, aux3, aux4, aux5;
	
	and AND1( aux1, ~a, ~b, ~d );
	and AND2( aux2, ~a, ~c, ~d ); 
	and AND3( aux3,  a, ~b, ~c ); 
	and AND4( aux4,  a, ~b,  d ); 
	and AND5( aux5,  a, ~c,  d ); 
	or  OR1 ( s, aux1, aux2, aux3, aux4, aux5 );
	
endmodule 

//-----------------------
//-- Circuito 03
//-----------------------
module e3 (s3, a, b, c, d, e );
	
	output s3;
	input  a, b, c, d, e;
	
	wire aux1, aux2, aux3, aux4, aux5, aux6;
	
	and AND1 ( aux1, a, b, d, e );
	and AND2 ( aux2, ~a, ~c, ~d );
	and AND3 ( aux3, ~b,  c, ~d );
	and AND4 ( aux4,  b,  c,  d );
	and AND5 ( aux5, ~b, ~d,  e );
	and AND6 ( aux6, c, e );
	or  OR1 	( s3, aux1, aux2, aux3, aux4, aux5, aux6 );
	
endmodule

//------------------------
//-- MODULO TESTE
//------------------------
module teste;

	wire      s1, s2, s3;
	reg       a, b, c, d, e;
	
	e1  E1 ( s1, a, b, c, d );
	e2  E2 ( s2, a, b, c, d );
	e3  E3 ( s3, a, b, c, d, e );
	
	initial begin
		a = 0; b = 0; c = 0; d = 0; e = 0;
	
		$display ("Guia 08 - Gustavo Guimaraes - 405804");
		$display ("\nSimplificacoes\n");
		$display ("a  b  c  d  e  =  S1  S2  S3" );
		$monitor("%b  %b  %b  %b  %b  =  %b   %b   %b",a, b, c, d, e, s1, s2, s3);
	#1 a = 0; b = 0; c = 1; d = 0; e = 1; 
	#1 a = 0; b = 1; c = 0; d = 1; e = 1;
	#1 a = 0; b = 1; c = 1; d = 0; e = 1;
	#1 a = 1; b = 0; c = 0; d = 1; e = 1;
	#1 a = 1; b = 0; c = 1; d = 0; e = 0;
	#1 a = 1; b = 1; c = 0; d = 1; e = 0;
	#1 a = 1; b = 1; c = 1; d = 0; e = 0;
	#1 a = 0; b = 0; c = 0; d = 1; e = 0;
	#1 a = 1; b = 1; c = 1; d = 1; e = 1;
	
	end
endmodule
	