// ------------------------- 
// Exemplo0032 - Somador de 4 bits com Flag Zero
// Nome: Guilherme Moreira Nunes
// Matricula: 408947
// -------------------------

module fullAdder(output s1,  output s0,  input a,  input b,  input carryIn);

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


// -- Somador de 4 bits (1 sinal - 3 amplitude)
module algebricAdder(output [0:3]s, input [0:3]a, input [0:3]b, input chave);

	// -- saidas intermediarias
	wire [0:3]s0;
	wire [0:3]s1;
	
	// -- selecao de operacao
	xor x4 (s1[3], b[3], chave);
	xor x3 (s1[2], b[2], chave);
	xor x2 (s1[1], b[1], chave);
	xor x1 (s1[0], b[0], chave);
	
	// -- descricao do circuito usando modulos anteriores
	fullAdder f1(s0[3], s[3], a[3], s1[3], chave);
	fullAdder f2(s0[2], s[2], a[2], s1[2], s0[3]);
	fullAdder f3(s0[1], s[1], a[1], s1[1], s0[2]);
	xor x1(s0[0], a[0], s1[0]);
	xor x2(s[0], s0[1], s0[0]);

endmodule

// -- module flag 0
module zeroFlag(output s,  input [0:3]i);
	nor (s, i[0], i[1], i[2], i[3]);
endmodule

//------------------
// Test Algebric Adder
//------------------
module testAdder;

	// ---- dados locais
	// -- registradores para os operandos
	reg [0:3]a = 4'b0000;
	reg [0:3]b = 4'b0000;
	reg chave = 0;
	wire [0:3]s;
	wire t;
	
	algebricAdder add1(s, a, b, chave);
	zeroFlag z1(t, s);
		
	// ---- parte principal
	
	initial
		begin
		
		//execucao unitaria
		$display ("Exemplo0032 - Guilherme Moreira Nunes - 408947");
		$display ("Somador de 4 bits com Flag Zero");
		
		$display("Chave 0=Soma/1=Subtracao");
		$display("     a      b      s   Flag");
		#1 $display ("%b: %b + %b = %b\t%b", chave, a, b, s, t);
			a = 4'b1110;	b = 4'b0100;
		#1 $display ("%b: %b + %b = %b\t%b", chave, a, b, s, t);
			chave = 1;
		#1 $display ("%b: %b - %b = %b\t%b", chave, a, b, s, t);
			a = 4'b0111;	b = 4'b1000;
		#1 $display ("%b: %b - %b = %b\t%b", chave, a, b, s, t);
		
		end
	endmodule //testAdder