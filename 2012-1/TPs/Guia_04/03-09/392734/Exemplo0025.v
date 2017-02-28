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
// Complement 2 - 4bits
// ------------------------- 
module complement (output [3:0]s, input [3:0]x);
		wire [1:0] s0;
		wire [1:0] s1;
		wire [1:0] s2;
		wire [1:0] s3;
		
		halfAdder	C0(s0, ~x[0], 1);
		halfAdder	C1(s1, ~x[1], s0[1]);
		halfAdder	C2(s2, ~x[2], s1[1]);
		halfAdder	C3(s3, ~x[3], s2[1]);
		
		assign s[0] = s0[0];
		assign s[1] = s1[0];
		assign s[2] = s2[0];
		assign s[3] = s3[0];	
endmodule //complement2

module test_difference; 
// ------------------------- definir dados 
	reg [3:0]x;
	wire [3:0]c;
	complement c2(c, x);
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0025 - João Henrique Mendes de Oliveira - 392734"); 
		$display("Test ALU's Complement 2"); 
		#1 x = 4'b0000;
		// projetar testes do somador completo
		$monitor("Complmento de 2 de %4b = %4b", x, c);
		#2 x = 4'b1111;
		#3 x = 4'b1010;
		#4 x = 4'b0101;
		#5 x = 4'b0010;
	end 
endmodule // test_difference