// ---------------------
// AC1 - 13/10/2010
//	Guia 10 - v 0.1
//
// Nome: Gustavo Guimarães
// Matricula: 405804
// ---------------------

//----------------------
//-- Latch SR ( NOR )
//----------------------
module latchSRNor ( q, q_bar, s, r);
	output	q, q_bar;
	input		s, r;
	
	nor NOR1 ( q_bar, s, q ); 
	nor NOR2 ( q, r, q_bar );
	
endmodule

//-----------------------
//-- TESTE
//-----------------------
module testeLatch;
	
	wire      q, q_bar;
	reg       s, r;
	
	latchSRNor  L1 ( q, q_bar, s, r );
	
	initial begin
		
		$display ("Guia 10 - Gustavo Guimaraes - 405804");
		$display ("\nLatch SR NOR\n");
		$display ("s  r  =  q   q_bar" );
		$monitor("%b  %b  =  %b   %b",s, r, q, q_bar);
	   s = 0; r = 0;
	#1 s = 0; r = 1;
	#1 s = 1; r = 0;
	#1 s = 1; r = 1;
	
		
	end	

endmodule