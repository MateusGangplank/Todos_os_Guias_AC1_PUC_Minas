// ------------------------- 
// Exemplo0024 - FULL COMPARATOR (DIFFERENCE)
// Nome: Thaise Souto 
// Matricula: 395504 
// ------------------------- 

// ------------------------- 
// half comparator 
// ------------------------- 
module halfComp (output s, input x, input y);
	wire diff;
	
	xor DIFF (diff, x, y);
	
	assign s = diff;
endmodule // halfComp

// ------------------------- 
// Exercicio0024 - Full Comparator (Difference) 6bits
// ------------------------- 
module fc6 (output s, input [5:0]a, input [5:0]b);
	wire s0, s1, s2, s3, s4, s5, saida; 
	
	halfComp HC0 (s0, a[0], b[0]);
	
	halfComp HC1 (s1, a[1], b[1]);
	
	halfComp HC2 (s2, a[2], b[2]);
	
	halfComp HC3 (s3, a[3], b[3]);
	
	halfComp HC4 (s4, a[4], b[4]);
	
	halfComp HC5 (s5, a[5], b[5]);
		
	or Verificador (saida, s0, s1, s2, s3, s4, s5);
	
	assign s = saida;
endmodule //exercicio

module test_difference; 
// ------------------------- definir dados 
	reg [5:0] x; 
	reg [5:0] y;
	wire diff; 
	fc6 SUB (diff, x, y);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0024 - Thaise Souto - 395504"); 
		$display("Test ALU's full comparator (difference) "); 
		
		// projetar testes do somador completo
		#1 x = 6'b110101; y = 6'b001011;
		$monitor("%6b != %6b ? %1b", x, y, diff);

		#2 x = 6'b000000; y = 6'b000000;
		#3 x = 6'b111111; y = 6'b000000;
		#4 x = 6'b111111; y = 6'b111111;	
	end 
endmodule // test_difference 