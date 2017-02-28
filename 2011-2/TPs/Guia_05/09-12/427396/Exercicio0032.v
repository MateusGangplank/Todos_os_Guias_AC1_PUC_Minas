// ------------------------- 
// Guia05 - Exemplo0032
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
// COMPARATOR ( S == 0 ? )
// ------------------------- 
module equals_zero (output s, input [5:0]a);
	wire saidaNOR;
	
	nor NOR1 (saidaNOR, a[0], a[1], a[2], a[3], a[4], a[5]);
	
	assign s = saidaNOR;
endmodule // equalzero

// ------------------------- 
// Exercicio
// ------------------------- 

module exercicio(output [5:0]s, input [5:0]a, input [5:0]b, input op);
	wire [5:0]c;
	wire [1:0]soma0;
	wire [1:0]soma1;
	wire [1:0]soma2;
	wire [1:0]soma3;
	wire [1:0]soma4;
	wire [1:0]soma5;
	
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
		
		assign s[0] = soma0[0];
		assign s[1] = soma1[0];
		assign s[2] = soma2[0];
		assign s[3] = soma3[0];
		assign s[4] = soma4[0];
		assign s[5] = soma5[0];
endmodule // exercicio

// ------------------------- 
// Modulo Principal
// ------------------------- 

module prinicipal;
// --------- definicao dados 
	reg [5:0] a;
	reg [5:0] b;
	reg op;
	wire [5:0] s;
	wire saidaZero;
	
	exercicio teste (s, a, b, op);
	equals_zero testeZero (saidaZero, s);
	
// --------- parte principal
	initial begin 
		$display("Exemplo0032 - Eduardo Manoel - 427396"); 
		$display("Test ALU\top = 0 -> soma\top = 1 -> subtracao\n"); 
		
		#1 a = 6'b001100; b = 6'b110011; op =1'b0;
		$monitor("a = %6b\t b = %6b\t op = %1b\n Resultado: %6b\n Resuldado == 0? %1b\n", a, b, op, s, saidaZero);
		
		#1 a = 6'b001100; b = 6'b110011; op =1'b1;
		#1 a = 6'b111111; b = 6'b111111; op =1'b0;
		#1 a = 6'b111111; b = 6'b111111; op =1'b1;
	end
endmodule //principaç