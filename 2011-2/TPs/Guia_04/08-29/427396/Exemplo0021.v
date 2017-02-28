// ------------------------- 
// Exemplo0021 - FULL ADDER 
// Nome: Eduardo Manoel 
// Matricula: 427396 
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
// Exercicio0021 - Full Adder 6bits
// ------------------------- 
module FA6 (output [5:0]s, input [5:0]a, input [5:0]b);
	wire [1:0] saida1;
	wire [1:0] saida2;
	wire [1:0] saida3;
	wire [1:0] saida4;	
	wire [1:0] saida5;
	wire [1:0] saida6;
	
	halfAdder HF (saida1, a[0], b[0]);	
	assign s[0] = saida1[0];
	
	fullAdder FA1 (saida2, a[1], b[1], saida1[1]); 
	assign s[1] = saida2[0];
	
	fullAdder FA2 (saida3, a[2], b[2], saida2[1]); 
	assign s[2] = saida3[0];
	
	fullAdder FA3 (saida4, a[3], b[3], saida3[1]);
	assign s[3] = saida4[0];
	
	fullAdder FA4 (saida5, a[4], b[4], saida4[1]);
	assign s[4] = saida5[0];
	
	fullAdder FA5 (saida6, a[5], b[5], saida5[1]);
	assign s[5] = saida6[0];
		
endmodule //exercicio

module test_fullAdder; 
// ------------------------- definir dados 
	reg [5:0] x; 
	reg [5:0] y;
	wire [5:0] soma; 
	FA6 ADD (soma, x, y);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0021 - Eduardo Manoel - 427396"); 
		$display("Test ALU's full adder"); 
		
		// projetar testes do somador completo
		#1 x = 6'b101101; y = 6'b010011;
		$monitor("%6b + %6b  = %6b", x, y, soma);
		#2 x = 6'b101100; y = 6'b010011;
	end 
endmodule // test_fullAdder 