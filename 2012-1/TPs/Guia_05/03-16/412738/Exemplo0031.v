// ------------------------- 
// Exemplo0031 - Algebric Adder 4 bits (1 sinal - 3 amplitude)
// Nome: Felipe Torres
// Matricula: 412738
// -------------------------

// -- Full Adder 2 bits

module fullAdder(output s1, output s0, input a, input b, input carryIn);

	// -- saidas intermediarias
	wire s2;
	wire s3;
	wire s4;

	// -- descricao do circuito por portas
	xor x1(s2, a, b);
	xor x2(s0, s2, carryIn);
	and a1(s3, a, b);
	and a2(s4, s2, carryIn);
	or o1(s1, s3, s4);

endmodule

// -- Algebric Adder 4 bits (1 sinal - 3 amplitude)

module algebricAdder(output [0:3]s, input [0:3]a, input [0:3]b, input key);

	// -- saidas intermediarias
	wire [0:3]s0;
	wire [0:3]s1;
	
	// -- seleção de operacao
	xor x1 (s1[3], b[3], key);
	xor x2 (s1[2], b[2], key);
	xor x3 (s1[1], b[1], key);
	xor x4 (s1[0], b[0], key);
	
	// -- descrição do circuito usando modulos anteriores
	fullAdder f1(s0[3], s[3], a[3], s1[3], key);
	fullAdder f2(s0[2], s[2], a[2], s1[2], s0[3]);
	fullAdder f3(s0[1], s[1], a[1], s1[1], s0[2]);
	xor x1(s0[0], a[0], s1[0]);
	xor x2(s[0], s0[1], s0[0]);

endmodule

//------------------
// Test Algebric Adder
//------------------
module testAdder;

	// ---- dados locais
	//registradores para os operandos
	reg [0:3]a = 4'b0000;
	reg [0:3]b = 4'b0000;
	reg key = 1'b0;
	wire [0:3]s;
	
	algebricAdder add1(s,a,b,key);
		
	// ---- parte principal	
	initial
		begin
		
		// -- execução unitaria
		$display ("Exemplo0031 - Felipe Torres - 412738");
		$display ("Algebric Adder 4 bits (1 sinal - 3 amplitude)\n\n");
		
		$display("Key 0 = Soma / 1 = Subtração");
		$display("Op.\ta\tb\ts");
		#1 $display ("%b: %b + %b = %b", key, a, b, s);
			a = 4'b1110;	b = 4'b0100;
		#1 $display ("%b: %b + %b = %b", key, a, b, s);
			key = 1'b1;
		#1 $display ("%b: %b - %b = %b", key, a, b, s);
			a = 4'b0111;	b = 4'b1000;
		#1 $display ("%b: %b - %b = %b", key, a, b, s);
		
		end
endmodule //testAdder