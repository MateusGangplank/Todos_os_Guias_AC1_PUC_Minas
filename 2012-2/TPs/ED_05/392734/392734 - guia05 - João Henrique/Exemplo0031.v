// ---------------------------------------
// Exemplo0031 - Algebric Adder 3 bits
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ---------------------------------------

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

// -- Algebric Adder 3 bits

module algebricAdder(output [0:2]s, input [0:2]a, input [0:2]b, input key);

	// -- saidas intermediarias
	wire [0:2]s0;
	wire [0:2]s1;
	
	// -- seleção de operacao
	xor x2 (s1[2], b[2], key);
	xor x3 (s1[1], b[1], key);
	xor x4 (s1[0], b[0], key);
	
	// -- descrição do circuito usando modulos anteriores
	fullAdder f2(s0[2], s[2], a[2], s1[2], key);
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
	reg [0:2]a = 3'b000;
	reg [0:2]b = 3'b000;
	reg key = 1'b0;
	wire [0:2]s;
	
	algebricAdder add1(s,a,b,key);
		
	// ---- parte principal	
	initial
		begin
		
		// -- execução unitaria
		$display ("Exemplo0031 - João Henrique - 392734");
		$display ("Algebric Adder 3 bits\n\n");
		
		$display("Key 0 = Soma / 1 = Subtração");
		$display("Op.a	b	s");
		#1 $display ("%b: %b + %b = %b", key, a, b, s);
			a = 3'b110;	b = 3'b100;
		#1 $display ("%b: %b + %b = %b", key, a, b, s);
			key = 1'b1;
		#1 $display ("%b: %b - %b = %b", key, a, b, s);
			a = 3'b111;	b = 3'b100;
		#1 $display ("%b: %b - %b = %b", key, a, b, s);
		
		end
endmodule //testAdder