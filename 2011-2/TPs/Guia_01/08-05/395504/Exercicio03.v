// -------------------------
// Exercicio03 - XNOR
// Nome: Thaise Souto Martins
// Matricula: 395504
// ------------------------- 
 
// ------------------------- 
// -- xnor gate 
// ------------------------- 

module xnorgate (output s, input p, input q);
	assign s = ~(p^q); 
endmodule

// --------------------- 
// -- test nor gate 
// --------------------- 

module testxnorgate;
	// ------------------------- dados locais 
	reg a, b;
	wire s;
	// ------------------------- instancia 
	   xnorgate XNOR1 (s, a, b);
	// ------------------------- preparacao 
	initial 
	begin: start
		a=0; 
		b=0;
	end
// ------------------------- parte principal 
	initial 
	begin : principal
		$display("Exercicio03  - Thaise Souto Martins - 395504");
      $display("Test XNOR gate"); 
      $display("\n ~(a^b) = s\n");
		a=00;
		b=00;
		$monitor("~(%b^%b) = %b", a, b, s);
		#1 b=1;
		#1 a=1;
			b=0;
		#1 b=1;  
	end

endmodule
    // Exercicio03  - Thaise Souto Martins - 395504
    // Test XNOR gate
    // 
    // ~(a^b) = s
    // 
    // ~(0^0) = 1
    // ~(0^1) = 0
    // ~(1^0) = 0
    // ~(1^1) = 1