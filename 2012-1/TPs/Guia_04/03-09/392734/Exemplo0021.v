// ------------------------- 
// Exemplo0021 - FULL ADDER 
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
// full adder 
// ------------------------- 
module fullAdder (output [1:0]s, input a, input b, input carryIn); 
	wire [1:0]soma1;
	wire [1:0]soma2;
	wire c_Out;
	
	halfAdder HF1 (soma1, a, b);
	halfAdder HF2 (soma2, soma1[0], carryIn );
	or C_OUT (c_Out, soma1[1], soma2[1]);
	
	assign s[1] = c_Out;
	assign s[0] = soma2[0];
endmodule // fullAdder


// ------------------------- 
// Full Adder 4 bits
// ------------------------- 
module FA4 (output [3:0]s, input [3:0]a, input [3:0]b);
	wire [1:0] saida1;
	wire [1:0] saida2;
	wire [1:0] saida3;
	wire [1:0] saida4;
	
	halfAdder HF (saida1, a[0], b[0]);	
	assign s[0] = saida1[0];
	
	fullAdder FA1 (saida2, a[1], b[1], saida1[1]); 
	assign s[1] = saida2[0];
	
	fullAdder FA2 (saida3, a[2], b[2], saida2[1]); 
	assign s[2] = saida3[0];
	
	fullAdder FA3 (saida4, a[3], b[3], saida3[1]);
	assign s[3] = saida4[0];
	
endmodule //exercicio

module test_fullAdder; 
// ------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y;
	wire [3:0] soma; 
	FA4 ADD (soma, x, y);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0021 - João Henrique Mendes de Oliveira - 392734"); 
		$display("Test ALU's full adder"); 
		
		// projetar testes do somador completo
		#1 x = 4'b1101; y = 4'b0011;
		$monitor("%4b + %4b  = %4b", x, y, soma);
		#2 x = 4'b1100; y = 4'b0011;
	end 
endmodule // test_fullAdder 