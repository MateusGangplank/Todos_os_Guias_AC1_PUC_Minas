// -------------------------
// Exercicio05 - OR
// Nome: Thaise Souto Martins
// Matricula: 395504
// ------------------------- 
 
// ------------------------- 
// -- or gate 
// ------------------------- 
module orgate (output s, input p, input q, input r);
	assign s = p | q | r;
endmodule

module testorgate;
	reg a, b, c;
	wire  s;
	orgate OR1 (s, a,b,c);
	
	initial 
	begin
		a = 0;
		b = 0;
		c = 0;
	end

	initial
	begin
		$display("Exercicio05 - Thaise Souto Martins - 395504");
      $display("Test or gate"); 
      $display("\na | b | c = s\n"); 
      a=0; b=0; c=0;
		$monitor("%b | %b | %b = %b",a,b,c,s);
		#1 c=1;
		#1 b=1;
			c=0;
		#1	c=1;
		#1 a=1;
			b=0;
			c=0;
		#1 c=1;
		#1 c=0;
			b=1;
		#1 c=1;
	end
	
endmodule

    // Exercicio05 - Thaise Souto Martins - 395504
    // Test or gate
    // 
    // a | b | c = s
    // 
    // 0 | 0 | 0 = 0
    // 0 | 0 | 1 = 1
    // 0 | 1 | 0 = 1
    // 0 | 1 | 1 = 1
    // 1 | 0 | 0 = 1
    // 1 | 0 | 1 = 1
    // 1 | 1 | 0 = 1
    // 1 | 1 | 1 = 1