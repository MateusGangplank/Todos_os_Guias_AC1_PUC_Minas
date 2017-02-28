// ------------------------- 
// Exemplo0024 - FULL COMPARATOR (DIFFERENCE)
// Nome: Thaise Souto
// Matricula: 395504
// ------------------------- 

// ------------------------- 
// half adder 
// ------------------------- 
module halfAdder (output [1:0]s, input x, input y);
	wire c_out;
	wire soma;
	
	and cOut (c_out, x, y);
	xor soma (soma, x, y);
	
	assign s[0] = soma;
	assign s[1] = c_out;
endmodule // halfAdder

// ------------------------- 
// Exercicio0024 - Complement 2 - 6bits
// ------------------------- 
module complement (output [5:0]s, input [5:0]x);
		wire [1:0] s0;
		wire [1:0] s1;
		wire [1:0] s2;
		wire [1:0] s3;
		wire [1:0] s4;
		wire [1:0] s5;
		
		halfAdder	C0(s0, ~x[0], 1);
		halfAdder	C1(s1, ~x[1], s0[1]);
		halfAdder	C2(s2, ~x[2], s1[1]);
		halfAdder	C3(s3, ~x[3], s2[1]);
		halfAdder	C4(s4, ~x[4], s3[1]);
		halfAdder	C5(s5, ~x[5], s4[1]);
		
		assign s[0] = s0[0];
		assign s[1] = s1[0];
		assign s[2] = s2[0];
		assign s[3] = s3[0];
		assign s[4] = s4[0];
		assign s[5] = s5[0];
		
endmodule //complement2

module test_difference; 
// ------------------------- definir dados 
	reg [5:0]x;
	wire [5:0]c;
	complement c2(c, x);
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0025 - Thaise Souto - 395504"); 
		$display("Test ALU's Complement 2"); 
		#1 x = 6'b000000;
		// projetar testes do somador completo
		$monitor("Complmento de 2 de %6b = %6b", x, c);
		#2 x = 6'b111111;
		#3 x = 6'b101010;
		#4 x = 6'b010101;
		#5 x = 6'b110010;
	end 
endmodule // test_difference 