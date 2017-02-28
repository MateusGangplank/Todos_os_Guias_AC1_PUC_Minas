// ------------------------- 
// Exemplo0024 - FULL COMPARATOR (DIFFERENCE)
// Nome: João Henrique Mendes de Oliveira 
// Matricula: 392734 
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
// Complemento de 2 - 3bits
// ------------------------- 
module complement (output [2:0]s, input [2:0]x);
		wire [1:0] s0;
		wire [1:0] s1;
		wire [1:0] s2;
		
		halfAdder	C0(s0, ~x[0], 1);
		halfAdder	C1(s1, ~x[1], s0[1]);
		halfAdder	C2(s2, ~x[2], s1[1]);
		
		assign s[0] = s0[0];
		assign s[1] = s1[0];
		assign s[2] = s2[0];
endmodule //complement2

module test_difference; 
// ------------------------- definir dados 
	reg [2:0]x;
	wire [2:0]c;
	complement c2(c, x);
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0025 - João Henrique Mendes de Oliveira - 392734"); 
		$display("Test ALU's Complement 2"); 
		#1 x = 3'b000;
		// projetar testes do somador completo
		$monitor("Complmento de 2 de %3b = %3b", x, c);
		#2 x = 3'b111;
		#3 x = 3'b010;
		#4 x = 3'b101;
		#5 x = 3'b110;
	end 
endmodule // test_difference