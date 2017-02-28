// ------------------------- 
// Exemplo0024 - FULL COMPARATOR (DIFFERENCE)
// Nome: João Henrique Mendes de Oliveira 
// Matricula: 392734
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
// Full Comparator (Difference) 3Bits
// ------------------------- 
module fc4 (output s, input [2:0]a, input [2:0]b);
	wire s0, s1, s2, s3, saida; 
	
	halfComp HC0 (s0, a[0], b[0]);
	
	halfComp HC1 (s1, a[1], b[1]);
	
	halfComp HC2 (s2, a[2], b[2]);
		
	or Verificador (saida, s0, s1, s2);
	
	assign s = saida;
endmodule //exercicio

module test_difference; 
// ------------------------- definir dados 
	reg [2:0] x; 
	reg [2:0] y;
	wire diff; 
	fc4 SUB (diff, x, y);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0024 - João Henrique Mendes de Oliveira - 392734"); 
		$display("Test ALU's full comparator (difference) "); 
		
		// projetar testes do somador completo
		#1 x = 3'b101; y = 3'b011;
		$monitor("%3b != %3b ? %1b", x, y, diff);

		#2 x = 3'b000; y = 3'b000;
		#3 x = 3'b111; y = 3'b000;
		#4 x = 3'b111; y = 3'b111;	
	end 
endmodule // test_difference 