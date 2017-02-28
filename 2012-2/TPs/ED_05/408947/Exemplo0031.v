// ------------------------- 
// Exemplo0031 - Somador de 3 bits
// Nome: Guilherme Moreira Nunes
// Matricula: 408947
// -------------------------

module fullAdder(output s1, output s0, input a, input b, input carryIn);

	// -- saidas
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

// -- Somador de 3 bits

module algebricAdder(output [0:2]s, input [0:2]a, input [0:2]b, input chave);

	// -- saidas
	wire [0:2]s0;
	wire [0:2]s1;
	
	xor x3 (s1[2], b[2], chave);
	xor x2 (s1[1], b[1], chave);
	xor x1 (s1[0], b[0], chave);
	
	// -- descrição do circuito usando modulos anteriores
	fullAdder f1(s0[2], s[2], a[2], s1[2], chave);
	fullAdder f2(s0[1], s[1], a[1], s1[1], s0[2]);
	xor x1(s0[0], a[0], s1[0]);
	xor x2(s[0], s0[1], s0[0]);

endmodule

//------------------
// Testar Somador de 3 bits
//------------------
module testAdder;

	// ---- dados locais
	//registradores para os operandos
	reg [0:2]a = 3'b000;
	reg [0:2]b = 3'b000;
	reg chave = 0;
	wire [0:2]s;
	
	algebricAdder add1(s,a,b,chave);
		
	// ---- parte principal	
	initial
		begin
		
		// -- execução unitaria
		$display ("Exemplo0031 - Guilherme Moreira Nunes - 408947");
		$display ("Somador de 3 bits\n\n");
		
		$display("Chave 0 = Soma / 1 = Subtração");
		$display("     a      b     s");
		#1 $display ("%b: %b + %b = %b", chave, a, b, s);
			a = 3'b110;	b = 3'b010;
		#1 $display ("%b: %b + %b = %b", chave, a, b, s);
		#1 $display ("%b: %b - %b = %b", chave, a, b, s);
			a = 3'b111;	b = 3'b100;
		#1 $display ("%b: %b - %b = %b", chave, a, b, s);
		
		end
endmodule //testAdder