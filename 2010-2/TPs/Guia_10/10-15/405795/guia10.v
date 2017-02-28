// ---------------------
// Guia08
// Nome: Daniel Sathler Silva
// Matricula: 405795
// ---------------------

// ---------------------
// -- Latch SR
// ---------------------

module latchSR(q, q0, r, s);

	input r, s;
	output q, q0;
	
	nor nor1(q0, r, q); 
	nor nor2(q, s, q0);
	
endmodule//Latch SR

// ---------------------
// -- Latch SR nand
// ---------------------

module latchSRnand(q, q0, r, s);

	input r, s;
	output q, q0;
	
	nand nand1(q0, r, q); 
	nand nand2(q, s, q0);

endmodule //Latch SR nand

// ---------------------
// -- Latch D
// ---------------------

module latchD(q, q0, d, e);

	input d,e;
	output q,q0;
	
	wire a1, a2;

	nand nand1(a1, d, e);
	nand nand2(a2, ~d, e);
	latchSRnand lSRN1 ( q0, q, a1, a2);
	
endmodule //Latch D

module teste;

	reg r,s;
	wire s1, s2, s3, s4, s5, s6;

	latchSR lSR(s1, s2, r, s);
	latchSRnand lSR1(s3, s4, r, s);
	latchD lD1(s5, s6, r, s);
	
	initial begin
		
		$display("Daniel Sathler Silva - 405795");
        $display("Teste Guia10.");
		$display("S R  - (SR)Q QO (SRn)Q Q0 (D)Q QO");
		$monitor("%b %b  =     %b %b       %b %b      %b %b", r, s, s1, s2, s3, s4, s5, s6);
		#1 r=0; s=0; 
		#1 r=1; s=0;
		#1 r=0; s=1; 
		#1 r=1; s=1; 
		 
	end
	
endmodule //teste	
