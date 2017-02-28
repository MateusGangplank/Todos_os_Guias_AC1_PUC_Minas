// ------------------------- 
// Exemplo0023 - FULL COMPARATOR (EQUALITY)
// Nome: Thaise Souto 
// Matricula: 395504
// ------------------------- 

// ------------------------- 
// half comparator 
// ------------------------- 
module halfComp (output s, input x, input y);
	wire equals;
	
	xnor EQUALS (equals, x, y);
	
	assign s = equals;
endmodule // halfComp

// ------------------------- 
// Exercicio0023 - Full Comparator (Equality) 6bits
// ------------------------- 
module fc6 (output s, input [5:0]a, input [5:0]b);
	wire s0, s1, s2, s3, s4, s5, saida; 
	
	halfComp HC0 (s0, a[0], b[0]);
	
	halfComp HC1 (s1, a[1], b[1]);
	
	halfComp HC2 (s2, a[2], b[2]);
	
	halfComp HC3 (s3, a[3], b[3]);
	
	halfComp HC4 (s4, a[4], b[4]);
	
	halfComp HC5 (s5, a[5], b[5]);
		
	and Verificador (saida, s0, s1, s2, s3, s4, s5);
	
	assign s = saida;
endmodule //exercicio

module test_equality; 
// ------------------------- definir dados 
	reg [5:0] x; 
	reg [5:0] y;
	wire equals; 
	fc6 SUB (equals, x, y);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0023 - Thaise Souto - 395504"); 
		$display("Test ALU's full comparator (equality) "); 
		
		// projetar testes do somador completo
		#1 x = 6'b110101; y = 6'b001011;
		$monitor("%6b == %6b ? %1b", x, y, equals);

		#2 x = 6'b000000; y = 6'b000000;
		#3 x = 6'b111111; y = 6'b000000;
		#4 x = 6'b111111; y = 6'b111111;	
	end 
endmodule // test_equality 