// ---------------------
// AC1 - 13/10/2010
//	Guia 10 - v 0.1
//
// Nome: Gustavo Guimarães
// Matricula: 405804
// ---------------------

//----------------------
//-- Latch SR ( NAND )
//----------------------
module latchSRNand ( q, q_bar, s, r, en, pr, cl );
	output q, q_bar;
	input  s, r, en, pr, cl;
	
	wire aux1, aux2;
	
	nand NAND1 ( aux1, s, en ); 
	nand NAND2 ( aux2, r, en );	
	nand NAND3 ( q, aux1, pr, q_bar );
	nand NAND4 ( q_bar, aux2, cl, q );
	
endmodule

//-----------------------
//-- TESTE
//-----------------------
module testeLatch;
	
	wire      q, q_bar;
	reg       s, r, en, pr, cl;
	
	latchSRNand L1 ( q, q_bar, s, r, en, pr, cl );
	
	initial begin
		
		$display ("Guia 10 - Gustavo Guimaraes - 405804");
		$display ("\nLatch SR NAND\n");
		$display ("s  r   en   pr  cl =  q   q_bar" );
		$monitor("%b  %b   %b    %b    %b =  %b    %b",s, r, en, pr, cl, q, q_bar);
	#1	s = 0; r = 0; en = 0; pr = 0; cl = 0;
	#1 s = 0; r = 0; en = 0; pr = 0; cl = 1;
	#1 s = 0; r = 0; en = 0; pr = 1; cl = 0;
	#1 s = 0; r = 0; en = 0; pr = 1; cl = 1; 
	#1	s = 0; r = 1; en = 1; pr = 0; cl = 1;
	#1	s = 1; r = 0; en = 1; pr = 1; cl = 0;
	#1	s = 0; r = 0; en = 1; pr = 1; cl = 1;
	#1	s = 0; r = 1; en = 1; pr = 1; cl = 1;
	#1	s = 1; r = 0; en = 1; pr = 1; cl = 1;
	#1	s = 1; r = 1; en = 1; pr = 1; cl = 1;
		
	end	

endmodule