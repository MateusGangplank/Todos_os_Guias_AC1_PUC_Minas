// ------------------------- 
// Guia05 - Exemplo0031
// Nome: Eduardo Manoel 
// Matricula: 427396 
// ------------------------- 
// ------------------------- 
// HALF ADDER
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
// FULL ADDER
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
// Exercicio
// ------------------------- 

module exercicio (output [1:0]s, input [5:0]a, input [5:0]b);
	wire [5:0]c;
	wire [1:0]soma0;
	wire [1:0]soma1;
	wire [1:0]soma2;
	wire [1:0]soma3;
	wire [1:0]soma4;
	wire [1:0]soma5;
	reg op = 1'b1;
	
	// --- XOR da segunda entrada com operador
		xor XOR0 (c[0], b[0], op);
		xor XOR1 (c[1], b[1], op);
		xor XOR2 (c[2], b[2], op);
		xor XOR3 (c[3], b[3], op);
		xor XOR4 (c[4], b[4], op);
		xor XOR5 (c[5], b[5], op);
	// --- Soma da primeira entrada com o XOR da segunda
		fullAdder FA0 (soma0, a[0], c[0], op);
		
		fullAdder FA1 (soma1, a[1], c[1], soma0[1]);
		
		fullAdder FA2 (soma2, a[2], c[2], soma1[1]);
		
		fullAdder FA3 (soma3, a[3], c[3], soma2[1]);
		
		fullAdder FA4 (soma4, a[4], c[4], soma3[1]);
		
		fullAdder FA5 (soma5, a[5], c[5], soma4[1]);

		assign s[1] = soma5[0];
		not saida0 (s[0], soma5[0]);
endmodule // exercicio

// ------------------------- 
// Modulo Principal
// ------------------------- 

module prinicipal;
// --------- definicao dados 
	reg [5:0] a;
	reg [5:0] b;
	wire [1:0]s;
	exercicio teste (s, a, b);

// --------- parte principal
	initial begin 
		$display("Exemplo0031 - Eduardo Manoel - 427396"); 
		$display("Test ALU\n 01 -> A > B\t op = 10 -> A < B\n"); 

		#1 a = 6'b100000; b = 6'b000001;
		$monitor("a = %6b\t b = %6b\t Resultado: %2b\n", a, b, s);
		#2 a = 6'b000001; b = 6'b100000;
	end
endmodule //principaç